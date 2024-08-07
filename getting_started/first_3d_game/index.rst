Your first 3D game
==================

In this step-by-step tutorial series, you will create your first complete 3D
game with Rebel Editor. By the end of the series, you will have a simple yet finished
project of your own like the animated gif below.

|image0|

The game we'll code here is similar to :doc:`/getting_started/first_2d_game/index`, with a twist:
you can now jump and your goal is to squash the creeps. This way, you will both
**recognize patterns** you learned in the previous tutorial and **build upon
them** with new code and features.

You will learn to:

- Work with 3D coordinates with a jumping mechanic.
- Use kinematic bodies to move 3D characters and detect when and how they
  collide.
- Use physics layers and a group to detect interactions with specific entities.
- Code basic procedural gameplay by instancing monsters at regular time
  intervals.
- Design a movement animation and change its speed at run-time.
- Draw a user interface on a 3D game.

And more.

This tutorial is for beginners who are following the complete getting started series.
We'll start slow with detailed instructions and shorten them as we do similar
steps.

.. note::

    You can follow this series without having done the 2D one. However, if
    you're new to game development, we recommend you to start with 2D. 3D game
    code is always more complex and the 2D series will give you foundations to
    follow along more comfortably.

We prepared some game assets so we can jump straight to the code. You can
download them here:
:download:`Squash the Creeps assets <files/squash-assets.zip>`

We will first work on a basic prototype for the player's movement. We will then
add the monsters that we'll spawn randomly around the screen. After that, we'll
implement the jump and squashing mechanic before refining the game with some
nice animation. We'll wrap up with the score and the retry screen.

Contents
--------

.. toctree::
   :maxdepth: 1
   :name: toc-learn-first_3d_game

   01.game_setup
   02.player_input
   03.player_movement_code
   04.mob_scene
   05.spawning_mobs
   06.jump_and_squash
   07.killing_player
   08.score_and_replay
   09.adding_animations
   going_further

.. |image0| image:: img/squash-the-creeps-final.gif
