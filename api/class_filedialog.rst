:github_url: hide

.. Generated automatically by RebelEngine/tools/scripts/rst_from_xml.py
.. DO NOT EDIT THIS FILE, but the FileDialog.xml source instead.
.. The source is found in docs or modules/<name>/docs.

.. _class_FileDialog:

FileDialog
==========

**Inherits:** :ref:`ConfirmationDialog<class_ConfirmationDialog>` **<** :ref:`AcceptDialog<class_AcceptDialog>` **<** :ref:`WindowDialog<class_WindowDialog>` **<** :ref:`Popup<class_Popup>` **<** :ref:`Control<class_Control>` **<** :ref:`CanvasItem<class_CanvasItem>` **<** :ref:`Node<class_Node>` **<** :ref:`Object<class_Object>`

Dialog for selecting files or directories in the filesystem.

Description
-----------

FileDialog is a preset dialog used to choose files and directories in the filesystem. It supports filter masks. The FileDialog automatically sets its window title according to the :ref:`mode<class_FileDialog_property_mode>`. If you want to use a custom title, disable this by setting :ref:`mode_overrides_title<class_FileDialog_property_mode_overrides_title>` to ``false``.

Properties
----------

+-----------------------------------------------+-----------------------------------------------------------------------------+---------------------------------------+
| :ref:`Access<enum_FileDialog_Access>`         | :ref:`access<class_FileDialog_property_access>`                             | ``0``                                 |
+-----------------------------------------------+-----------------------------------------------------------------------------+---------------------------------------+
| :ref:`String<class_String>`                   | :ref:`current_dir<class_FileDialog_property_current_dir>`                   | ``"res://"``                          |
+-----------------------------------------------+-----------------------------------------------------------------------------+---------------------------------------+
| :ref:`String<class_String>`                   | :ref:`current_file<class_FileDialog_property_current_file>`                 | ``""``                                |
+-----------------------------------------------+-----------------------------------------------------------------------------+---------------------------------------+
| :ref:`String<class_String>`                   | :ref:`current_path<class_FileDialog_property_current_path>`                 | ``"res://"``                          |
+-----------------------------------------------+-----------------------------------------------------------------------------+---------------------------------------+
| :ref:`bool<class_bool>`                       | dialog_hide_on_ok                                                           | ``false`` *(parent override)*         |
+-----------------------------------------------+-----------------------------------------------------------------------------+---------------------------------------+
| :ref:`PoolStringArray<class_PoolStringArray>` | :ref:`filters<class_FileDialog_property_filters>`                           | ``PoolStringArray(  )``               |
+-----------------------------------------------+-----------------------------------------------------------------------------+---------------------------------------+
| :ref:`Mode<enum_FileDialog_Mode>`             | :ref:`mode<class_FileDialog_property_mode>`                                 | ``4``                                 |
+-----------------------------------------------+-----------------------------------------------------------------------------+---------------------------------------+
| :ref:`bool<class_bool>`                       | :ref:`mode_overrides_title<class_FileDialog_property_mode_overrides_title>` | ``true``                              |
+-----------------------------------------------+-----------------------------------------------------------------------------+---------------------------------------+
| :ref:`bool<class_bool>`                       | :ref:`show_hidden_files<class_FileDialog_property_show_hidden_files>`       | ``false``                             |
+-----------------------------------------------+-----------------------------------------------------------------------------+---------------------------------------+
| :ref:`String<class_String>`                   | window_title                                                                | ``"Save a File"`` *(parent override)* |
+-----------------------------------------------+-----------------------------------------------------------------------------+---------------------------------------+

Methods
-------

+-------------------------------------------+------------------------------------------------------------------------------------------------------+
| void                                      | :ref:`add_filter<class_FileDialog_method_add_filter>` **(** :ref:`String<class_String>` filter **)** |
+-------------------------------------------+------------------------------------------------------------------------------------------------------+
| void                                      | :ref:`clear_filters<class_FileDialog_method_clear_filters>` **(** **)**                              |
+-------------------------------------------+------------------------------------------------------------------------------------------------------+
| void                                      | :ref:`deselect_items<class_FileDialog_method_deselect_items>` **(** **)**                            |
+-------------------------------------------+------------------------------------------------------------------------------------------------------+
| :ref:`LineEdit<class_LineEdit>`           | :ref:`get_line_edit<class_FileDialog_method_get_line_edit>` **(** **)**                              |
+-------------------------------------------+------------------------------------------------------------------------------------------------------+
| :ref:`VBoxContainer<class_VBoxContainer>` | :ref:`get_vbox<class_FileDialog_method_get_vbox>` **(** **)**                                        |
+-------------------------------------------+------------------------------------------------------------------------------------------------------+
| void                                      | :ref:`invalidate<class_FileDialog_method_invalidate>` **(** **)**                                    |
+-------------------------------------------+------------------------------------------------------------------------------------------------------+

Theme Properties
----------------

+-------------------------------+--------------------------------------------------------------------------------+---------------------------+
| :ref:`Color<class_Color>`     | :ref:`file_icon_modulate<class_FileDialog_theme_color_file_icon_modulate>`     | ``Color( 1, 1, 1, 1 )``   |
+-------------------------------+--------------------------------------------------------------------------------+---------------------------+
| :ref:`Color<class_Color>`     | :ref:`files_disabled<class_FileDialog_theme_color_files_disabled>`             | ``Color( 0, 0, 0, 0.7 )`` |
+-------------------------------+--------------------------------------------------------------------------------+---------------------------+
| :ref:`Color<class_Color>`     | :ref:`folder_icon_modulate<class_FileDialog_theme_color_folder_icon_modulate>` | ``Color( 1, 1, 1, 1 )``   |
+-------------------------------+--------------------------------------------------------------------------------+---------------------------+
| :ref:`Texture<class_Texture>` | :ref:`file<class_FileDialog_theme_icon_file>`                                  |                           |
+-------------------------------+--------------------------------------------------------------------------------+---------------------------+
| :ref:`Texture<class_Texture>` | :ref:`folder<class_FileDialog_theme_icon_folder>`                              |                           |
+-------------------------------+--------------------------------------------------------------------------------+---------------------------+
| :ref:`Texture<class_Texture>` | :ref:`parent_folder<class_FileDialog_theme_icon_parent_folder>`                |                           |
+-------------------------------+--------------------------------------------------------------------------------+---------------------------+
| :ref:`Texture<class_Texture>` | :ref:`reload<class_FileDialog_theme_icon_reload>`                              |                           |
+-------------------------------+--------------------------------------------------------------------------------+---------------------------+
| :ref:`Texture<class_Texture>` | :ref:`toggle_hidden<class_FileDialog_theme_icon_toggle_hidden>`                |                           |
+-------------------------------+--------------------------------------------------------------------------------+---------------------------+

Signals
-------

.. _class_FileDialog_signal_dir_selected:

- **dir_selected** **(** :ref:`String<class_String>` dir **)**

Emitted when the user selects a directory.

----

.. _class_FileDialog_signal_file_selected:

- **file_selected** **(** :ref:`String<class_String>` path **)**

Emitted when the user selects a file by double-clicking it or pressing the **OK** button.

----

.. _class_FileDialog_signal_files_selected:

- **files_selected** **(** :ref:`PoolStringArray<class_PoolStringArray>` paths **)**

Emitted when the user selects multiple files.

Enumerations
------------

.. _enum_FileDialog_Mode:

.. _class_FileDialog_constant_MODE_OPEN_FILE:

.. _class_FileDialog_constant_MODE_OPEN_FILES:

.. _class_FileDialog_constant_MODE_OPEN_DIR:

.. _class_FileDialog_constant_MODE_OPEN_ANY:

.. _class_FileDialog_constant_MODE_SAVE_FILE:

enum **Mode**:

- **MODE_OPEN_FILE** = **0** --- The dialog allows selecting one, and only one file.

- **MODE_OPEN_FILES** = **1** --- The dialog allows selecting multiple files.

- **MODE_OPEN_DIR** = **2** --- The dialog only allows selecting a directory, disallowing the selection of any file.

- **MODE_OPEN_ANY** = **3** --- The dialog allows selecting one file or directory.

- **MODE_SAVE_FILE** = **4** --- The dialog will warn when a file exists.

----

.. _enum_FileDialog_Access:

.. _class_FileDialog_constant_ACCESS_RESOURCES:

.. _class_FileDialog_constant_ACCESS_USERDATA:

.. _class_FileDialog_constant_ACCESS_FILESYSTEM:

enum **Access**:

- **ACCESS_RESOURCES** = **0** --- The dialog only allows accessing files under the :ref:`Resource<class_Resource>` path (``res://``).

- **ACCESS_USERDATA** = **1** --- The dialog only allows accessing files under user data path (``user://``).

- **ACCESS_FILESYSTEM** = **2** --- The dialog allows accessing files on the whole file system.

Property Descriptions
---------------------

.. _class_FileDialog_property_access:

- :ref:`Access<enum_FileDialog_Access>` **access**

+-----------+-------------------+
| *Default* | ``0``             |
+-----------+-------------------+
| *Setter*  | set_access(value) |
+-----------+-------------------+
| *Getter*  | get_access()      |
+-----------+-------------------+

The file system access scope. See enum ``Access`` constants.

**Warning:** Currently, in sandboxed environments such as web builds or sandboxed macOS apps, FileDialog cannot access the host file system.

----

.. _class_FileDialog_property_current_dir:

- :ref:`String<class_String>` **current_dir**

+-----------+------------------------+
| *Default* | ``"res://"``           |
+-----------+------------------------+
| *Setter*  | set_current_dir(value) |
+-----------+------------------------+
| *Getter*  | get_current_dir()      |
+-----------+------------------------+

The current working directory of the file dialog.

----

.. _class_FileDialog_property_current_file:

- :ref:`String<class_String>` **current_file**

+-----------+-------------------------+
| *Default* | ``""``                  |
+-----------+-------------------------+
| *Setter*  | set_current_file(value) |
+-----------+-------------------------+
| *Getter*  | get_current_file()      |
+-----------+-------------------------+

The currently selected file of the file dialog.

----

.. _class_FileDialog_property_current_path:

- :ref:`String<class_String>` **current_path**

+-----------+-------------------------+
| *Default* | ``"res://"``            |
+-----------+-------------------------+
| *Setter*  | set_current_path(value) |
+-----------+-------------------------+
| *Getter*  | get_current_path()      |
+-----------+-------------------------+

The currently selected file path of the file dialog.

----

.. _class_FileDialog_property_filters:

- :ref:`PoolStringArray<class_PoolStringArray>` **filters**

+-----------+-------------------------+
| *Default* | ``PoolStringArray(  )`` |
+-----------+-------------------------+
| *Setter*  | set_filters(value)      |
+-----------+-------------------------+
| *Getter*  | get_filters()           |
+-----------+-------------------------+

The available file type filters. For example, this shows only ``.png`` and ``.gd`` files: ``set_filters(PoolStringArray(["*.png ; PNG Images","*.gd ; GDScript Files"]))``. Multiple file types can also be specified in a single filter. ``"*.png, *.jpg, *.jpeg ; Supported Images"`` will show both PNG and JPEG files when selected.

----

.. _class_FileDialog_property_mode:

- :ref:`Mode<enum_FileDialog_Mode>` **mode**

+-----------+-----------------+
| *Default* | ``4``           |
+-----------+-----------------+
| *Setter*  | set_mode(value) |
+-----------+-----------------+
| *Getter*  | get_mode()      |
+-----------+-----------------+

The dialog's open or save mode, which affects the selection behavior. See enum ``Mode`` constants.

----

.. _class_FileDialog_property_mode_overrides_title:

- :ref:`bool<class_bool>` **mode_overrides_title**

+-----------+---------------------------------+
| *Default* | ``true``                        |
+-----------+---------------------------------+
| *Setter*  | set_mode_overrides_title(value) |
+-----------+---------------------------------+
| *Getter*  | is_mode_overriding_title()      |
+-----------+---------------------------------+

If ``true``, changing the ``Mode`` property will set the window title accordingly (e.g. setting mode to :ref:`MODE_OPEN_FILE<class_FileDialog_constant_MODE_OPEN_FILE>` will change the window title to "Open a File").

----

.. _class_FileDialog_property_show_hidden_files:

- :ref:`bool<class_bool>` **show_hidden_files**

+-----------+------------------------------+
| *Default* | ``false``                    |
+-----------+------------------------------+
| *Setter*  | set_show_hidden_files(value) |
+-----------+------------------------------+
| *Getter*  | is_showing_hidden_files()    |
+-----------+------------------------------+

If ``true``, the dialog will show hidden files.

Method Descriptions
-------------------

.. _class_FileDialog_method_add_filter:

- void **add_filter** **(** :ref:`String<class_String>` filter **)**

Adds ``filter`` to the list of filters, which restricts what files can be picked.

A ``filter`` should be of the form ``"filename.extension ; Description"``, where filename and extension can be ``*`` to match any string. Filters starting with ``.`` (i.e. empty filenames) are not allowed.

Example filters: ``"*.png ; PNG Images"``, ``"project.rebel ; Rebel Project"``.

----

.. _class_FileDialog_method_clear_filters:

- void **clear_filters** **(** **)**

Clear all the added filters in the dialog.

----

.. _class_FileDialog_method_deselect_items:

- void **deselect_items** **(** **)**

Clear currently selected items in the dialog.

----

.. _class_FileDialog_method_get_line_edit:

- :ref:`LineEdit<class_LineEdit>` **get_line_edit** **(** **)**

Returns the LineEdit for the selected file.

**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their :ref:`CanvasItem.visible<class_CanvasItem_property_visible>` property.

----

.. _class_FileDialog_method_get_vbox:

- :ref:`VBoxContainer<class_VBoxContainer>` **get_vbox** **(** **)**

Returns the vertical box container of the dialog, custom controls can be added to it.

**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their :ref:`CanvasItem.visible<class_CanvasItem_property_visible>` property.

----

.. _class_FileDialog_method_invalidate:

- void **invalidate** **(** **)**

Invalidate and update the current dialog content list.

Theme Property Descriptions
---------------------------

.. _class_FileDialog_theme_color_file_icon_modulate:

- :ref:`Color<class_Color>` **file_icon_modulate**

+-----------+-------------------------+
| *Default* | ``Color( 1, 1, 1, 1 )`` |
+-----------+-------------------------+

The color modulation applied to the file icon.

----

.. _class_FileDialog_theme_color_files_disabled:

- :ref:`Color<class_Color>` **files_disabled**

+-----------+---------------------------+
| *Default* | ``Color( 0, 0, 0, 0.7 )`` |
+-----------+---------------------------+

The color tint for disabled files (when the ``FileDialog`` is used in open folder mode).

----

.. _class_FileDialog_theme_color_folder_icon_modulate:

- :ref:`Color<class_Color>` **folder_icon_modulate**

+-----------+-------------------------+
| *Default* | ``Color( 1, 1, 1, 1 )`` |
+-----------+-------------------------+

The color modulation applied to the folder icon.

----

.. _class_FileDialog_theme_icon_file:

- :ref:`Texture<class_Texture>` **file**

Custom icon for files.

----

.. _class_FileDialog_theme_icon_folder:

- :ref:`Texture<class_Texture>` **folder**

Custom icon for folders.

----

.. _class_FileDialog_theme_icon_parent_folder:

- :ref:`Texture<class_Texture>` **parent_folder**

Custom icon for the parent folder arrow.

----

.. _class_FileDialog_theme_icon_reload:

- :ref:`Texture<class_Texture>` **reload**

Custom icon for the reload button.

----

.. _class_FileDialog_theme_icon_toggle_hidden:

- :ref:`Texture<class_Texture>` **toggle_hidden**

Custom icon for the toggle hidden button.

.. |virtual| replace:: :abbr:`virtual (This method should typically be overridden by the user to have any effect.)`
.. |const| replace:: :abbr:`const (This method has no side effects. It doesn't modify any of the instance's member variables.)`
.. |vararg| replace:: :abbr:`vararg (This method accepts any number of arguments after the ones described here.)`
