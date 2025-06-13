# The Facade Pattern (A structural design pattern)

The Facade design pattern simplifies access to complex systems through a more convenient interface.
* Perfect for using complicated frameworks
* Hides complexity behind a more intuive, simpler interface
* Forwards client requests to the appropriate components

Thus the Facade decouples clients from intricate frameworks and libraries, simplifying their usage.

## Purpose
* Offers an easier way to interact with the system
* Narrows down provided functionality to the necessary minimum
* Shields clients from frequent changes in underlying components

## Benefits
* Provides a more straightforward interface to complex subsystems
* Shields client from underlying changes
* Simplifies complex or poorly designed interfaces
* Exposes functionality but hides unnecessary complexity


## Pitfall
* Responsibility overload
* Breaking the Single Responsiblity Principle (Each type should have a clear and well-defined responsiblity)
* Exposing the underlying types

