Compiling with Mono
===================

.. highlight:: shell

Requirements
------------

- Mono 6.12.0 or greater
- MSBuild
- NuGet
- **On Linux/macOS only:** pkg-config

You may need to import necessary certificates for NuGet to perform HTTPS
requests.

The recommended method is to use **curl**'s CA (Certificate Authorities) certificate bundle.

Run the following commands to download and import it. On Windows, you can run it
from the Mono command line prompt (or the regular prompt if you added Mono's
``bin`` directory to your ``PATH`` environment variable)::

    # If using PowerShell, replace `curl` with `curl.exe` below.
    curl -LO https://curl.haxx.se/ca/cacert.pem
    cert-sync --user cacert.pem

Alternatively, you can use the following command, though it's deprecated and may not work correctly::

    mozroots --import --sync

Environment variables
---------------------

By default, SCons will try to find Mono in the Windows Registry on Windows or
via ``pkg-config`` on other platforms. You can specify a different installation
directory by passing the ``mono_prefix`` command-line option to SCons; e.g.
``scons [...] mono_prefix=%ProgramFiles%/Mono``.

This is the directory that contains the subdirectories ``include`` and ``lib``.

Enable the Mono module
----------------------

By default, the Mono module is disabled when building. To enable it, add the
option ``module_mono_enabled=yes`` to the SCons command line.

Generate the glue
-----------------

Glue sources are the wrapper functions that will be called by managed methods.
These source files must be generated before building your final binaries. In
order to generate them, first, you must build a temporary Rebel Engine binary with the
options ``tools=yes`` and ``mono_glue=no``::

    scons p=<platform> tools=yes module_mono_enabled=yes mono_glue=no

After the build finishes, you need to run the compiled executable with the
parameter ``--generate-mono-glue`` followed by the path to an output directory.
This path must be ``modules/mono/glue`` in the Rebel Engine directory::

    <rebel_binary> --generate-mono-glue modules/mono/glue

This command will tell Rebel Engine to generate the file ``modules/mono/glue/mono_glue.gen.cpp``,
the C# solution for the Rebel Engine API at ``modules/mono/glue/GodotSharp/GodotSharp/Generated``,
and the C# solution for the editor tools at ``modules/mono/glue/GodotSharp/GodotSharpEditor/Generated``.
Once these files are generated, you can build Rebel Engine for all the desired targets
without having to repeat this process.

``<rebel_binary>`` refers to the tools binary you compiled above with the Mono
module enabled. Its exact name will differ based on your system and
configuration, but should be of the form
``bin/rebel.<platform>.tools.<bits>.mono``, e.g. ``bin/rebel.x11.tools.64.mono``
or ``bin/rebel.windows.tools.64.mono.exe``. Be especially aware of the **.mono**
suffix! If you've previously compiled Rebel Engine without Mono support, you might have
similarly named binaries without this suffix. These binaries can't be used to
generate the Mono glue.

Notes
^^^^^

- **Do not build your final binaries with** ``mono_glue=no``.
  This disables C# scripting. This option must be used only for the temporary
  binary that will generate the glue. Rebel Engine will print a warning at startup if
  it was built without the glue sources.
- The glue sources must be regenerated every time the ClassDB-registered API
  changes. That is, for example, when a new method is registered to the
  scripting API or one of the parameters of such a method changes.
  Rebel Engine will print an error at startup if there is an API mismatch
  between ClassDB and the glue sources.


Rebuild with Mono glue
----------------------

Once you have generated the Mono glue, you can build the final binary with
``mono_glue=yes``. This is the default value for ``mono_glue``, so you can also
omit it. To build a Mono-enabled editor::

    scons p=<platform> tools=yes module_mono_enabled=yes mono_glue=yes

And Mono-enabled export templates::

    scons p=<platform> tools=no module_mono_enabled=yes mono_glue=yes

If everything went well, apart from the normal output, SCons should have created
the following files in the ``bin`` directory:

- If you're not linking the Mono runtime statically, the build script will place
  the Mono runtime shared library (``monosgen-2.0``) next to the Rebel Engine
  binary in the output directory. Make sure to include this library when
  distributing Rebel Engine. When targeting Android, no extra steps are required as
  this library is automatically copied to ``#platforms/android/project/engine/src/main/jniLibs/`` and
  Gradle takes care of the rest.
- Unlike "classical" Rebel Engine builds, when building with the Mono module enabled
  (and depending on the target platform), a data directory may be created both
  for the editor and for export templates. This directory is important for
  proper functioning and must be distributed together with Rebel Engine.
  More details about this directory in
  :ref:`Data directory<compiling_with_mono_data_directory>`.

Examples
--------

Example (Windows)
^^^^^^^^^^^^^^^^^

::

    # Build temporary binary
    scons p=windows tools=yes module_mono_enabled=yes mono_glue=no
    # Generate glue sources
    bin\rebel.windows.tools.64.mono --generate-mono-glue modules/mono/glue

    ### Build binaries normally
    # Editor
    scons p=windows target=release_debug tools=yes module_mono_enabled=yes
    # Export templates
    scons p=windows target=release_debug tools=no module_mono_enabled=yes
    scons p=windows target=release tools=no module_mono_enabled=yes

Example (X11)
^^^^^^^^^^^^^

::

    # Build temporary binary
    scons p=x11 tools=yes module_mono_enabled=yes mono_glue=no
    # Generate glue sources
    bin/rebel.x11.tools.64.mono --generate-mono-glue modules/mono/glue

    ### Build binaries normally
    # Editor
    scons p=x11 target=release_debug tools=yes module_mono_enabled=yes
    # Export templates
    scons p=x11 target=release_debug tools=no module_mono_enabled=yes
    scons p=x11 target=release tools=no module_mono_enabled=yes

.. _compiling_with_mono_data_directory:

Data directory
--------------

The data directory is a dependency for Rebel Engine binaries built with the Mono module
enabled. It contains important files for the correct functioning of Rebel Engine. It
must be distributed together with the Rebel Engine executable.

.. note:: The information below doesn't apply for Android, iOS and WASM,
          as there is no data directory for these platforms.

Export templates
^^^^^^^^^^^^^^^^

The name of the data directory for an export template differs based on the
configuration it was built with. The format is
``data.mono.<platform>.<bits>.<target>``, e.g. ``data.mono.x11.32.release_debug`` or
``data.mono.windows.64.release``.

This directory must be placed with its original name next to the Rebel export
templates. When exporting a project, the Rebel Editor will also copy this directory with
the game executable but the name will be changed to ``data_<APPNAME>``, where
``<APPNAME>`` is the application name as specified in the project setting
``application/config/name``.

In the case of macOS, where the export template is compressed as a ZIP archive,
the contents of the data directory can be placed in the following locations
inside the ZIP archive:

+-------------------------------------------------------+---------------------------------------------------------------+
| ``bin/data.mono.<platform>.<bits>.<target>/Mono/lib`` | ``/osx_template.app/Contents/Frameworks/GodotSharp/Mono/lib`` |
+-------------------------------------------------------+---------------------------------------------------------------+
| ``bin/data.mono.<platform>.<bits>.<target>/Mono/etc`` | ``/osx_template.app/Contents/Resources/GodotSharp/Mono/etc``  |
+-------------------------------------------------------+---------------------------------------------------------------+

Editor
^^^^^^

The name of the data directory for the Rebel Engine editor will always be
``GodotSharp``. The contents of this directory are the following:

- ``Api``
- ``Mono`` (optional)
- ``Tools``

The ``Api`` subdirectory contains the Rebel Engine API assemblies. On macOS, if the
Rebel Editor is distributed as a bundle, the contents of the data directory may
be placed in the following locations:

+-------------------------------------------------------+---------------------------------------------------------------+
| ``bin/data.mono.<platform>.<bits>.<target>/Api``      | ``<bundle_name>.app/Contents/Frameworks/GodotSharp/Api``      |
+-------------------------------------------------------+---------------------------------------------------------------+
| ``bin/data.mono.<platform>.<bits>.<target>/Mono/lib`` | ``<bundle_name>.app/Contents/Frameworks/GodotSharp/Mono/lib`` |
+-------------------------------------------------------+---------------------------------------------------------------+
| ``bin/data.mono.<platform>.<bits>.<target>/Mono/etc`` | ``<bundle_name>.app/Contents/Resources/GodotSharp/Mono/etc``  |
+-------------------------------------------------------+---------------------------------------------------------------+
| ``bin/data.mono.<platform>.<bits>.<target>/Tools``    | ``<bundle_name>.app/Contents/Frameworks/GodotSharp/Tools``    |
+-------------------------------------------------------+---------------------------------------------------------------+

The ``Mono`` subdirectory is optional. It will be needed when distributing the
editor, as issues can arise when the user-installed Mono version isn't identical
to the one the Rebel Editor was built with. Pass ``copy_mono_root=yes`` to SCons
when building the editor in order to create this folder and its contents.

The ``Tools`` subdirectory contains tools required by the editor, like the
``GodotTools`` assemblies and its dependencies.

Building the Mono runtime
-------------------------

When building Rebel Engine for the desktop, you will likely use the pre-built Mono runtime
that is installed on your system. This likely won't be the case when targeting other
platforms like Android, iOS and WebAssembly. You will have to build the Mono runtime
yourself for those platforms.

Targeting Android
-----------------

Compiling the Android export templates with Mono is a bit simpler than it is for
the desktop platforms, as there are no additional steps required after building.
There is no need to worry about run-time dependencies like a data directory or
the shared library (when dynamically linking) as those are automatically added
to the Gradle project.

Once you've built Mono, you can proceed to build Rebel Engine with the instructions
described in this page and the
:doc:`Compiling for Android</development/compiling/build_for_android>` page.
Make sure to let SCons know about the location of the Mono runtime you've just built, e.g.:
``scons [...] mono_prefix="$HOME/mono-installs/android-armeabi-v7a-release"``
(This path may be different on your system).

Targeting iOS
-------------

Once you've built Mono, you can proceed to build Rebel Engine with the instructions
described in this page and the
:doc:`Compiling for iOS</development/compiling/compiling_for_ios>` page.
Make sure to let SCons know about the location of the Mono runtime you've just built, e.g.:
``scons [...] mono_prefix="$HOME/mono-installs/ios-arm64-release"``
(This path may be different on your system).

After building Rebel Engine for each architecture, you will notice SCons has
copied the Mono libraries for each of them to the output directory:

::

    #bin/libmono-native.iphone.<arch>.a
    #bin/libmonosgen-2.0.iphone.<arch>.a
    #bin/libmonoprofiler-log.iphone.<arch>.a

    #bin/libmono-ilgen.iphone.<arch>.a
    #bin/libmono-ee-interp.iphone.<arch>.a
    #bin/libmono-icall-table.iphone.<arch>.a

The last three are only for iOS devices and are not available for the iOS simulator.

These libraries must be put in universal (multi-architecture) "fat"
files to be distributed with the export templates.

The following bash script will create the "fat" libraries in the directory ``#bin/ios/iphone-mono-libs``:

::

    mkdir -p bin/ios
    mkdir -p bin/ios/iphone-mono-libs

    lipo -create bin/libmonosgen-2.0.iphone.arm64.a bin/libmonosgen-2.0.iphone.x86_64.a -output bin/ios/iphone-mono-libs/libmonosgen-2.0.iphone.fat.a
    lipo -create bin/libmono-native.iphone.arm64.a bin/libmono-native.iphone.x86_64.a -output bin/ios/iphone-mono-libs/libmono-native.iphone.fat.a
    lipo -create bin/libmono-profiler-log.iphone.arm64.a bin/libmono-profiler-log.iphone.x86_64.a -output bin/ios/iphone-mono-libs/libmono-profiler-log.iphone.fat.a

    # The Mono libraries for the interpreter are not available for simulator builds
    lipo -create bin/libmono-ee-interp.iphone.arm64.a -output bin/ios/iphone-mono-libs/libmono-ee-interp.iphone.fat.a
    lipo -create bin/libmono-icall-table.iphone.arm64.a -output bin/ios/iphone-mono-libs/libmono-icall-table.iphone.fat.a
    lipo -create bin/libmono-ilgen.iphone.arm64.a -output bin/ios/iphone-mono-libs/libmono-ilgen.iphone.fat.a

The ``iphone-mono-libs`` folder must be distributed with the export templates.
The Rebel Editor will look for the libraries in ``<templates>/iphone-mono-libs/lib<name>.iphone.fat.a``.

Targeting WebAssembly
---------------------

Building for WebAssembly currently involves the same process regardless of whether the Mono module is enabled.

Once you've built Mono, you can proceed to build Rebel Engine with the instructions
described in this page and the
:doc:`Compiling for the Web</development/compiling/compiling_for_web>` page.
Make sure to let SCons know about the location of the Mono runtime you've just built, e.g.:
``scons [...] mono_prefix="$HOME/mono-installs/wasm-runtime-release"``
(This path may be different on your system).

Base Class Library
------------------

The export templates must also include the BCL (Base Class Library) for each target platform.
Rebel Engine looks for the BCL folder at ``<templates>/bcl/<target_platform>``,
where ``<target_platform>`` is the same name passed to the SCons ``platform`` option,
e.g.: ``<templates>/bcl/windows``, ``<templates>/bcl/javascript``.

Alternatively, Rebel Engine will look for them in the following locations:

+-------------------+---------------------------------+
|      Android      |  ``<templates>/bcl/monodroid``  |
+-------------------+---------------------------------+
|        iOS        |  ``<templates>/bcl/monotouch``  |
+-------------------+---------------------------------+
|    WebAssembly    |    ``<templates>/bcl/wasm``     |
+-------------------+---------------------------------+
|  Linux and macOS  |   ``<templates>/bcl/net_4_x``   |
+-------------------+---------------------------------+
|      Windows      | ``<templates>/bcl/net_4_x_win`` |
+-------------------+---------------------------------+

As of now, we're assuming the same BCL profile can be used for both Linux and macOS,
but this may change in the future as they're not guaranteed to be the same
(as is the case with the Windows BCL).

If the target platform is the same as the platform of the Rebel Editor,
then the editor will use the BCL it's running on (``<data_folder>/Mono/lib/mono/4.5``)
if it cannot find the BCL in the export templates.

AOT cross-compilers
-------------------

To perform ahead-of-time (AOT) compilation for other platforms, Rebel Engine needs to have
access to the Mono cross-compilers for that platform and architecture.

Rebel Engine will look for the cross-compiler executable in the AOT compilers folder.
The location of this folder is ``<data_folder>/Tools/aot-compilers/``.

After building them, copy the executable to the Rebel Engine AOT compilers directory. The
executable name is ``<triple>-mono-sgen``, e.g.: ``aarch64-apple-darwin-mono-sgen``.

Command-line options
--------------------

The following is the list of command-line options available when building with
the Mono module:

- **module_mono_enabled**\ =yes | **no**

  - Build Rebel Engine with the Mono module enabled.

- **mono_glue**\ =\ **yes** | no

  - Whether to include the glue source files in the build
    and define ``MONO_GLUE_DISABLED`` as a preprocessor macro.

- **mono_prefix**\ =path

  - Path to the Mono installation directory for the target platform and architecture.

- **mono_static**\ =yes | no

  - Whether to link the Mono runtime statically.
  - The default is **yes** for iOS and WASM, and **no** for other platforms.

- **copy_mono_root**\ =yes | **no**

  - Whether to copy the Mono framework assemblies
    and configuration files required by the Rebel Editor.
