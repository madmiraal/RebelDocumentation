3D rendering limitations
========================

.. seealso::

    In addition to the limitations below, mobile platforms have even more
    limitations on 3D rendering compared to desktop platforms.
    See :doc:`/tutorials/platforms/mobile_rendering_limitations` for more information.

Introduction
------------

Due to their focus on performance, real-time rendering engines have many
limitations. The Rebel Renderer is no exception. To work effectively with those
limitations, you need to understand them.

Texture size limits
-------------------

On desktops and laptops, textures larger than 8192×8192 may not be supported on
older devices. You can check your target GPU's limitations on
`GPUinfo.org <https://www.gpuinfo.org/>`__.

Mobile GPUs are typically limited to 4096×4096 textures. Also, some mobile GPUs
don't support repeating non-power-of-two-sized textures. Therefore, if you want
your texture to display correctly on all platforms, you should avoid using
textures larger than 4096×4096 and use a power of two size if the texture needs
to repeat.

Color banding
-------------

When using the GLES3 or Vulkan renderers, the Rebel 3D engine renders internally
in HDR. However, the rendering output will be tonemapped to a low dynamic range
so it can be displayed on the screen. This can result in visible banding,
especially when using untextured materials. This can also be seen in 2D projects
when using smooth gradient textures.

There are two main ways to alleviate banding:

- Enable **Use Debanding** in the Project Settings. This applies a
  fullscreen debanding shader as a post-processing effect and is very cheap.
  Fullscreen debanding is only supported when using the GLES3 or Vulkan renderers.
  It also requires HDR to be enabled in the Project Settings (which is the default).
- Alternatively, bake some noise into your textures. This is mainly effective in 2D,
  e.g. for vignetting effects. This technique works even if your project is
  rendered in LDR, which means it will work when using the GLES2 renderer.

.. seealso::

    See `Banding in Games: A Noisy Rant <https://loopit.dk/banding_in_games.pdf>`__
    for more details about banding and ways to combat it.

Depth buffer precision
----------------------

To sort objects in 3D space, rendering engines rely on a *depth buffer* (also
called *Z-buffer*). This buffer has a finite precision: 24-bit on desktop
platforms, sometimes 16-bit on mobile platforms (for performance reasons). If
two different objects end up on the same buffer value, then Z-fighting will
occur. This will materialize as textures flickering back and forth as the camera
moves or rotates.

To make the depth buffer more precise over the rendered area, you should
*increase* the Camera node's **Near** property. However, be careful: if you set
it too high, players will be able to see through nearby geometry. You should
also *decrease* the Camera node's **Far** property to the lowest permissible value
for your use case, though keep in mind it won't impact precision as much as the
**Near** property.

If you only need high precision when the player can see far away, you could
change it dynamically based on the game conditions. For instance, if the player
enters an airplane, the **Near** property can be temporarily increased to avoid
Z-fighting in the distance. It can then be decreased once the player leaves the
airplane.

Depending on the scene and viewing conditions, you may also be able to move the
Z-fighting objects further apart without the difference being visible to the
player.

Transparency sorting
--------------------

In Rebel Engine, transparent materials are drawn after opaque materials. Transparent
objects are sorted back to front before being drawn based on the Spatial's
position, not the vertex position in world space. Due to this, overlapping
objects may often be sorted out of order. To fix improperly sorted objects, tweak
the material's :ref:`Render Priority <class_Material_property_render_priority>`
property. This will force specific materials to appear in front or behind of
other transparent materials. Even then, this may not always be sufficient.

Some rendering engines feature *order-independent transparency* techniques to
alleviate this, but this is costly on the GPU. Rebel Engine currently doesn't provide
this feature. There are still several ways to avoid this problem:

- Only make materials transparent if you actually need it. If a material only
  has a small transparent part, consider splitting it into a separate material.
  This will allow the opaque part to cast shadows and may also improve
  performance.

- If your texture mostly has fully opaque and fully transparent areas, you can
  use alpha testing instead of alpha blending. This transparency mode is faster
  to render and doesn't suffer from transparency issues. Enable
  **Parameters > Use Alpha Scissor** in SpatialMaterial, and adjust
  **Alpha Scissor Threshold** accordingly if needed. Note that MSAA will not
  anti-alias the texture's edges, but FXAA will.

- If you need to render semi-transparent areas of the texture, alpha scissor
  isn't suitable. Instead, setting the SpatialMaterial's
  **Parameters > Depth Draw Mode** property to **Opaque Pre-Pass** can sometimes
  work (at a performance cost).

- If you want a material to fade with distance, use the SpatialMaterial
  distance fade mode **Pixel Dither** or **Object Dither** instead of
  **PixelAlpha**. This will make the material opaque. This way, it can also
  cast shadows.

Multi-sample antialiasing
-------------------------

Multi-sample antialiasing (MSAA) takes multiple *coverage* samples at the edges
of polygons when rendering objects. It does not increase the number of *color*
samples used to render a scene. Here's what this means in practice:

- Edges of meshes will be smoothed out nicely (as well as supersampling would).
- Transparent materials that use *alpha testing* (1-bit transparency) won't be smoothed out.
- Specular aliasing ("sparkles" that appear on reflective surfaces) won't be reduced.

There are several ways to work around this limitation depending on your performance budget:

- To make specular aliasing less noticeable, open the Project Settings and enable
  **Rendering > Quality > Screen Space Filters > Screen Space Roughness Limiter**.
  This filter has a moderate cost on performance. It should be enabled only if
  you actually need it.

- Enable FXAA in addition to (or instead of) MSAA. Since FXAA is a screen-space
  antialiasing method, it will smooth out anything. As a downside, it will also
  make the scene appear blurrier, especially at resolutions below 1440p.

- Render the scene at a higher resolution, then display it in a ViewportTexture
  that matches the window size. Make sure to enable **Filter** on the
  ViewportTexture flags. This technique is called *supersampling* and is very
  slow. Its use is generally only recommended for offline rendering.
