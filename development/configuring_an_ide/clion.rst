CLion
=====

`CLion <https://www.jetbrains.com/clion/>`_ is a commercial `JetBrains <https://www.jetbrains.com/>`_ IDE for C++.

Open the Rebel Engine project
-----------------------------

In the **Welcome to CLion** window,
select **Open**.

.. figure:: img/clion-welcome-to-clion.png
   :figclass: figure-w480
   :align: center

In the **Open File or Project** window,
browse to and select the `RebelEngine` root folder.

.. figure:: img/clion-open-file-or-project.png
   :figclass: figure-w480
   :align: center

Click **OK** to open the project.

.. figure:: img/clion-readme.png
   :figclass: figure-w480
   :align: center

Create a Build Configuration
----------------------------

Rebel Engine uses `SCons <https://scons.org/>` as the :doc:`build system </development/compiling/introduction_to_the_buildsystem>`.
We need to create the build configurations manually.
From the **Add Configuration...** menu, select **Edit Configurations...**.

.. figure:: img/clion-edit-configurations.png
   :figclass: figure-w480
   :align: center

From **Add new run configuration...**, select **Custom Build Application**.

.. figure:: img/clion-add-new-run-configuration.png
   :figclass: figure-w480
   :align: center

You will probably create multiple build configurations.
Name each run configuration, so you can easily identify it.

Each run configuration needs a build target.
Select **Configure Custom Build Targets**.

.. figure:: img/clion-debug-configuration.png
   :figclass: figure-w480
   :align: center

From **Add target**, select **Tool**.

.. figure:: img/clion-add-target.png
   :figclass: figure-w480
   :align: center

Name your build target.
It makes sense to give your build targets the same name as your run targets.

You will need to create a new build tool.
To the right of the **Build** drop-down list,
click the three dots: **...**.

.. figure:: img/clion-build.png
   :figclass: figure-w480
   :align: center

Click **Add**.

.. figure:: img/clion-external-tools-add.png
   :figclass: figure-w480
   :align: center

Name your build tool.
Again, it makes sense to give your tools the same name as your targets.

Under **Tool Settings**, **Program**, type ``scons``.
Under **Arguments** enter the arguments for this target.
For more information on the arguments available, see :doc:`/development/compiling/introduction_to_the_buildsystem`.

.. figure:: img/clion-create-tool.png
   :figclass: figure-w480
   :align: center

Click **OK** to save the build tool.

.. figure:: img/clion-external-tools-debug.png
   :figclass: figure-w480
   :align: center

Click **OK** to select your new build tool.

Now, create a new clean tool.
To the right of the **Clean** drop-down list,
click the three dots: **...**.

.. figure:: img/clion-clean.png
   :figclass: figure-w480
   :align: center

Name your clean tool.
It makes sense to give your clean tool the same name as your build tool, but add `Clean` to the name.
Use the same arguments for the build tool, but add the ``--clean`` argument.

.. figure:: img/clion-create-clean-tool.png
   :figclass: figure-w480
   :align: center

Click **OK** to save the clean tool.

.. figure:: img/clion-debug-settings.png
   :figclass: figure-w480
   :align: center

When you have finished creating and selecting the build and clean tools,
click **OK** to save the new build target.

.. figure:: img/clion-debug-configuration-target.png
   :figclass: figure-w480
   :align: center

You can now select your new target for your run configuration.
Click **OK** to save your configuration.

Run and Debug Rebel Editor
--------------------------

Once you have created a build target,
you can build your selected configuration.
If you want to run and debug a Rebel Editor build on your platform,
you will need to specify the executable created.

Although you can simply enter the location and name of the executable,
it is easiest if you build Rebel Editor first.
Once you have completed the build, you can add the executable by browsing to it.

Edit your configuration.
If you try run a configuration without specifying the executable,
you will be prompted to add an executable.

.. figure:: img/clion-debug-configuration-executable.png
   :figclass: figure-w480
   :align: center

To the right of the **Executable** drop-down list,
click the three dots: **...**.

Browse to the `bin` folder,
and select the created executable.

.. figure:: img/clion-select-executable.png
   :figclass: figure-w480
   :align: center

Click **OK** to save the specified executable for your configuration.
You will now be able to run and debug the Rebel Editor build.

There are two additional configuration fields worth noting:

1. The **Program arguments** field can be used to run and debug Rebel Editor with additional program arguments.

2. If required, the **Working directory** field can be used to test specific projects. Set it to the folder containing the ``project.rebel`` file.

That's it! You're now ready to start contributing to Rebel Engine using the CLion IDE.
