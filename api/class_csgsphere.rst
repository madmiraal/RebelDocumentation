:github_url: hide

.. Generated automatically by RebelEngine/tools/scripts/rst_from_xml.py
.. DO NOT EDIT THIS FILE, but the CSGSphere.xml source instead.
.. The source is found in docs or modules/<name>/docs.

.. _class_CSGSphere:

CSGSphere
=========

**Inherits:** :ref:`CSGPrimitive<class_CSGPrimitive>` **<** :ref:`CSGShape<class_CSGShape>` **<** :ref:`GeometryInstance<class_GeometryInstance>` **<** :ref:`VisualInstance<class_VisualInstance>` **<** :ref:`CullInstance<class_CullInstance>` **<** :ref:`Spatial<class_Spatial>` **<** :ref:`Node<class_Node>` **<** :ref:`Object<class_Object>`

A CSG Sphere shape.

Description
-----------

This node allows you to create a sphere for use with the CSG system.

**Note:** CSG nodes are intended to be used for level prototyping. Creating CSG nodes has a significant CPU cost compared to creating a :ref:`MeshInstance<class_MeshInstance>` with a :ref:`PrimitiveMesh<class_PrimitiveMesh>`. Moving a CSG node within another CSG node also has a significant CPU cost, so it should be avoided during gameplay.

Tutorials
---------

- :doc:`Prototyping levels with CSG </tutorials/3d/csg_tools>`

Properties
----------

+---------------------------------+------------------------------------------------------------------+----------+
| :ref:`Material<class_Material>` | :ref:`material<class_CSGSphere_property_material>`               |          |
+---------------------------------+------------------------------------------------------------------+----------+
| :ref:`int<class_int>`           | :ref:`radial_segments<class_CSGSphere_property_radial_segments>` | ``12``   |
+---------------------------------+------------------------------------------------------------------+----------+
| :ref:`float<class_float>`       | :ref:`radius<class_CSGSphere_property_radius>`                   | ``1.0``  |
+---------------------------------+------------------------------------------------------------------+----------+
| :ref:`int<class_int>`           | :ref:`rings<class_CSGSphere_property_rings>`                     | ``6``    |
+---------------------------------+------------------------------------------------------------------+----------+
| :ref:`bool<class_bool>`         | :ref:`smooth_faces<class_CSGSphere_property_smooth_faces>`       | ``true`` |
+---------------------------------+------------------------------------------------------------------+----------+

Property Descriptions
---------------------

.. _class_CSGSphere_property_material:

- :ref:`Material<class_Material>` **material**

+----------+---------------------+
| *Setter* | set_material(value) |
+----------+---------------------+
| *Getter* | get_material()      |
+----------+---------------------+

The material used to render the sphere.

----

.. _class_CSGSphere_property_radial_segments:

- :ref:`int<class_int>` **radial_segments**

+-----------+----------------------------+
| *Default* | ``12``                     |
+-----------+----------------------------+
| *Setter*  | set_radial_segments(value) |
+-----------+----------------------------+
| *Getter*  | get_radial_segments()      |
+-----------+----------------------------+

Number of vertical slices for the sphere.

----

.. _class_CSGSphere_property_radius:

- :ref:`float<class_float>` **radius**

+-----------+-------------------+
| *Default* | ``1.0``           |
+-----------+-------------------+
| *Setter*  | set_radius(value) |
+-----------+-------------------+
| *Getter*  | get_radius()      |
+-----------+-------------------+

Radius of the sphere.

----

.. _class_CSGSphere_property_rings:

- :ref:`int<class_int>` **rings**

+-----------+------------------+
| *Default* | ``6``            |
+-----------+------------------+
| *Setter*  | set_rings(value) |
+-----------+------------------+
| *Getter*  | get_rings()      |
+-----------+------------------+

Number of horizontal slices for the sphere.

----

.. _class_CSGSphere_property_smooth_faces:

- :ref:`bool<class_bool>` **smooth_faces**

+-----------+-------------------------+
| *Default* | ``true``                |
+-----------+-------------------------+
| *Setter*  | set_smooth_faces(value) |
+-----------+-------------------------+
| *Getter*  | get_smooth_faces()      |
+-----------+-------------------------+

If ``true`` the normals of the sphere are set to give a smooth effect making the sphere seem rounded. If ``false`` the sphere will have a flat shaded look.

.. |virtual| replace:: :abbr:`virtual (This method should typically be overridden by the user to have any effect.)`
.. |const| replace:: :abbr:`const (This method has no side effects. It doesn't modify any of the instance's member variables.)`
.. |vararg| replace:: :abbr:`vararg (This method accepts any number of arguments after the ones described here.)`
