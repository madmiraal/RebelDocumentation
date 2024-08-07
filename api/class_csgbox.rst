:github_url: hide

.. Generated automatically by RebelEngine/tools/scripts/rst_from_xml.py
.. DO NOT EDIT THIS FILE, but the CSGBox.xml source instead.
.. The source is found in docs or modules/<name>/docs.

.. _class_CSGBox:

CSGBox
======

**Inherits:** :ref:`CSGPrimitive<class_CSGPrimitive>` **<** :ref:`CSGShape<class_CSGShape>` **<** :ref:`GeometryInstance<class_GeometryInstance>` **<** :ref:`VisualInstance<class_VisualInstance>` **<** :ref:`CullInstance<class_CullInstance>` **<** :ref:`Spatial<class_Spatial>` **<** :ref:`Node<class_Node>` **<** :ref:`Object<class_Object>`

A CSG Box shape.

Description
-----------

This node allows you to create a box for use with the CSG system.

**Note:** CSG nodes are intended to be used for level prototyping. Creating CSG nodes has a significant CPU cost compared to creating a :ref:`MeshInstance<class_MeshInstance>` with a :ref:`PrimitiveMesh<class_PrimitiveMesh>`. Moving a CSG node within another CSG node also has a significant CPU cost, so it should be avoided during gameplay.

Tutorials
---------

- :doc:`Prototyping levels with CSG </tutorials/3d/csg_tools>`

Properties
----------

+---------------------------------+-------------------------------------------------+---------+
| :ref:`float<class_float>`       | :ref:`depth<class_CSGBox_property_depth>`       | ``2.0`` |
+---------------------------------+-------------------------------------------------+---------+
| :ref:`float<class_float>`       | :ref:`height<class_CSGBox_property_height>`     | ``2.0`` |
+---------------------------------+-------------------------------------------------+---------+
| :ref:`Material<class_Material>` | :ref:`material<class_CSGBox_property_material>` |         |
+---------------------------------+-------------------------------------------------+---------+
| :ref:`float<class_float>`       | :ref:`width<class_CSGBox_property_width>`       | ``2.0`` |
+---------------------------------+-------------------------------------------------+---------+

Property Descriptions
---------------------

.. _class_CSGBox_property_depth:

- :ref:`float<class_float>` **depth**

+-----------+------------------+
| *Default* | ``2.0``          |
+-----------+------------------+
| *Setter*  | set_depth(value) |
+-----------+------------------+
| *Getter*  | get_depth()      |
+-----------+------------------+

Depth of the box measured from the center of the box.

----

.. _class_CSGBox_property_height:

- :ref:`float<class_float>` **height**

+-----------+-------------------+
| *Default* | ``2.0``           |
+-----------+-------------------+
| *Setter*  | set_height(value) |
+-----------+-------------------+
| *Getter*  | get_height()      |
+-----------+-------------------+

Height of the box measured from the center of the box.

----

.. _class_CSGBox_property_material:

- :ref:`Material<class_Material>` **material**

+----------+---------------------+
| *Setter* | set_material(value) |
+----------+---------------------+
| *Getter* | get_material()      |
+----------+---------------------+

The material used to render the box.

----

.. _class_CSGBox_property_width:

- :ref:`float<class_float>` **width**

+-----------+------------------+
| *Default* | ``2.0``          |
+-----------+------------------+
| *Setter*  | set_width(value) |
+-----------+------------------+
| *Getter*  | get_width()      |
+-----------+------------------+

Width of the box measured from the center of the box.

.. |virtual| replace:: :abbr:`virtual (This method should typically be overridden by the user to have any effect.)`
.. |const| replace:: :abbr:`const (This method has no side effects. It doesn't modify any of the instance's member variables.)`
.. |vararg| replace:: :abbr:`vararg (This method accepts any number of arguments after the ones described here.)`
