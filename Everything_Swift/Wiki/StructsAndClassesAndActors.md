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
    
- Classes are reference types
    - a reference to the original variable is passed instead. If the value is changed in any variables, all the values of any references' value will change.

- Identical to (=== or !==) means that two constants or variables that are classes points to the same memory. to compare values then use (== or !=)
