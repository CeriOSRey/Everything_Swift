#  Structure and Classes

- Similarities
    - Define properties and store values
    - Define methods to provide functionalities
    - Define initializers to setup their initial states
    - Be exteneded to expand their functionality beyond a default implementation
    - Conform to protocols to provide standard functionality

- Classes can while Structs cant
    - inheritance enables one class to inherit the characteristic of another
    - Type casting enables one class to inherit the characteristics of another
    - Deinitializers enable an instance of a class to free up any memory
    - Reference counting allows more than one reference to a class inheritance

- Use dot syntax to access properties and methods.
- Structs have automatic memberwise initializers.
    - let vga = Resolution(width: 640, height: 480)
    
- Structs and Enums are value types
    - value is copied when it's assigned to a variable or constant or when its passed to a function.
    - integers, floats, bools, strings, arrays and dictionaries are Structs
    - **copy on write means a second object will not be created on assignment, It will be created when we do something to/with it.**
    - **Memory allocation of a struct inside a class will be in a heap because it a part of the class**
    - STACK 
        - LIFO
        - thread safe - each thread has its own stack
        - amount of memory required can be calculated at compile time because it does not support Dynamic Memory Allocation
        - cost of allocation/dealloc is less - stack pointer can be moved by single instruction
    
- Classes are reference types
    - a reference to the original variable is passed instead. If the value is changed in any variables, all the values of any references' value will change.
    - **Reference type(class or actors) properties inside a Struct will stay as reference types when accessed.**
    - HEAP
        - used when size can not be calculated at compile time 
        - Reference type - Lifetime can not be judged because different object may point to it through app lifecycle
        - Thread unsafe - Global memory space is needed for reference type 
        - tougher to manage and slower than struct because heap is not organized like stack
    

- Identical to (=== or !==) means that two constants or variables that are classes points to the same memory. to compare values then use (== or !=)


# Actors
- Actors are reference type
- do not support inheritance
- automatically takes care of concurrency related issues
    - by keeping track of mutable/immutable properties
- Although a reference type, this is thread safe
