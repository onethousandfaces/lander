# Lander  

               .       .                   .       .      .     .      .
              .    .         .    .            .     ______
          .           .             .               ////////
                    .    .   ________   .  .      /////////     .    .
               .            |.____.  /\        ./////////    .
        .                 .//      \/  |\     /////////
           .       .    .//          \ |  \ /////////       .     .   .
                        ||.    .    .| |  ///////// .     .
         .    .         ||           | |//`,/////                .
                 .       \\        ./ //  /  \/   .
      .                    \\.___./ //\` '   ,_\     .     .
              .           .     \ //////\ , /   \                 .    .
                           .    ///////// \|  '  |    .
          .        .          ///////// .   \ _ /          .
                            /////////                              .
                     .   ./////////     .     .
             .           --------   .                  ..             .
      .               .        .         .                       .
                            ________________________
    ____________------------                        -------------_________

## quickstart

    git submodule update --init

Then open project in unity.

Then use the A and D keys to fly or whatever.


## About 

Landing landers on asteroids, QWOP style.

## Conditions

### Win

A successful landing. This may be achieved through skill or luck.

### Lose

* Crash land
* Bounce off and away
* Land upside down
* No landing (miss)

## Lander

A lander consists of the following components:

* A body
* 4 thrusters
* 1 rocket
* Fuel tank (consumed by rocket)
* A tether

### Forces acting on a lander

* Total mass (body + fuel)
* Thruster position & strength
* Rocket position & strength
* Fuel quantity (weight & time left with rocket power)
* Length of tether (affects distance from surface before use)
* Inertia
* Gravity from asteroid (directional gravity) -- did we say we'd keep this?
* Physical contact with asteroid (collision)

There may be multiple landers with varying configurations of components with varying masses, quantities and strengths.

## TODO

Achievements
Asteroid shape/size/constraint
Lander shapes and sizes

### Changes

- Added an example of a gravity test
