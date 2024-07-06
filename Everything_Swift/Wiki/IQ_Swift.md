#  Swift

## 1. How would you compare two tuples to ensure their values are identical in swift?
- compare both with `==` or you can get the elements
- compare the elements by comparing their index with `someTuple.0` or `someTuple.1`
- can also give the members a name ie. `someTuple = (firstName: Rey, lastName: Cerio)` and access like this `someTuple.firstName`

## 2. How would you explain operator overloading to a junior developer?
- operator overloading allows you to redefine how operators behave with various data types. Let’s create a custom operator for exponentiation (**). Normally, we’d use the pow() function, but with operator overloading, we can make ** work instead:
```
infix operator **

func **(lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}

let result = 2 ** 4 // Calculates 2 raised to the power of 4
print("Result:", result) // Output: Result: 16.0
```

## 3. How would you explain `protocol` to a new Swift developer?
- `protocol` are blue prints or requirements that conforming types must implement
- conforming types will not need to implement a function if that function has a default implementation
- default implementation can only be added to a extension of a protocol

## 4. In which situations do Swift functions not need a return keyword?
- when the function needs to return a value ie. `func getUser() -> User { return User() }`

## 5. What are property observers?
- they are closures declared after the property to observe changes to the property.
```
var temperature: Double = 0 {
    willSet {
        print("Temperature will change to \(newValue)°C")
    }
    didSet {
        print("Temperature changed from \(oldValue)°C to \(temperature)°C")
    }
}

temperature = 25 // Output: Temperature will change to 25.0°C
                //         Temperature changed from 0.0°C to 25.0°C
```

## 6. What are raw strings?
- raw strings are enclosed in # symbols. They allow you to represent string data without the need for escape characters
```
let rawString = #"""
This is a raw string.
No need for escape characters: \\, \", etc.
"""#
```

## 7. What does the #error compiler directive do?
- Unlike the #warning directive, which shows a warning but allows compilation to continue, #error stops the compilation process entirely. It’s used for critical issues that need immediate resolution before the application can run.
```
class SomeClass {
    #error("This class needs to be implemented.")
    // Other class code...
}
```

## 8. What does the #if swift syntax do?
- #if swift syntax in Swift allows you to conditionally compile code based on the Swift version being used.
```
#if swift(>=5.3)
    // Code for Swift 5.3 or higher
#else
    // Code for Swift versions prior to 5.3
#endif

```

## 9. What does the assert() function do?
- the assert() function is a debugging aid that allows you to test whether a given condition in your code is true during development.
```
func sum(of numbers: [Int]) -> Int {
    assert(numbers.count > 0, "This should always be given some numbers to sum.")
    return numbers.reduce(0, +)
}
```

## 10. What does the canImport() compiler condition do?
- The #if canImport(module) compiler condition in Swift allows you to conditionally compile code based on whether a specific module can be imported. Here’s how it works:

- Purpose:
It checks if a given module (e.g., UIKit, Foundation, etc.) can be imported for the current platform.
Useful for writing platform-specific code without causing errors on platforms where certain modules are unavailable1.
- Example:
Suppose you want to use UIKit on iOS and AppKit on macOS:
Swift
```
#if canImport(UIKit)
    // Code specific to iOS (UIKit)
#elseif canImport(AppKit)
    // Code specific to macOS (AppKit)
#else
    // Fallback code for other platforms
#endif
```

## 11. What does the CaseIterable protocol do?
- The CaseIterable protocol in Swift is used to define types whose instances can be iterated over using a switch statement.
- Basic Usage:
    Types that conform to the CaseIterable protocol are typically enumerations without associated values.
    When using a CaseIterable type, you can access a collection of all of the type’s cases by using the type’s allCases property.
- Example:
```
    enum CompassDirection: CaseIterable {
        case north, south, east, west
    }

    print("There are \(CompassDirection.allCases.count) directions.")
    // Output: "There are 4 directions."

    let caseList = CompassDirection.allCases
        .map { "\($0)" }
        .joined(separator: ", ")
    // caseList == "north, south, east, west"
```
- Automatic Implementation:
    The compiler automatically provides an implementation of the CaseIterable requirements for any enumeration without associated values or @available attributes on its cases.
    The synthesized allCases collection provides the cases in order of their declaration.
    
## 12. What does the final keyword do, and why would you want to use it?
- You can apply final to individual methods, properties, or subscripts within a class. These members cannot be overridden by subclasses.
- Use this when you want to protect certain functionality from modification by subclasses.

## 13. What does the nil coalescing operator do?
- `??` provides a default value ie.:
```
let name: String? = nil
let unwrappedName = name ?? "Anonymous"
```

## 14. What is the difference between if let and guard let?
- Use guard let when you want to ensure the presence of a value throughout the function or scope.
- Use if let when you want to conditionally perform an action based on the presence of a value. Does not necessarily exit the function or scope.

## 15. What is the difference between try, try?, and try! in Swift?
- try: Used with a do-catch statement, try allows for detailed error handling.
    If an error occurs, it’s caught by the catch block.
- try?: Converts the throwing call into an optional.
    If an error occurs, it sets the result to nil.
    Useful when you want to continue execution even if an error happens.
- try!: Force unwraps the code, assuming no errors will occur.
    If an error does happen, your app crashes.
    Use with caution; be confident that no error will be thrown.

## 16. What problem does optional chaining solve?
- Optional chaining in Swift addresses the issue of safely accessing properties, methods, and subscripts on optional values.
- if any part of the chain is nil then the whole chain is nil.

## 17. What's the difference between String? and String! in Swift?
- String? (Optional String):
    Represents an optional string.
    Can hold either a valid string value or be nil.
    You must unwrap it (using if let, guard let, or optional chaining) to access its value safely.
- String! (Implicitly Unwrapped Optional String):
    Also represents an optional string.
    Can be nil, but it’s implicitly force-unwrapped when accessed.
    Use with caution; if it’s nil, your app will crash.
    Typically used for properties that are set during initialization and guaranteed to have a value afterward.
## 18. When would you use the guard keyword in Swift?
- When you want to unwrap an optional and you want to exit the block/scope if the value is nil.

## 19. Apart from the built-in ones, can you give an example of property wrappers?
- Property wrappers in Swift allow you to extract common logic into distinct wrapper objects, reducing boilerplate code. While there are built-in property wrappers like @State, @Binding, and @ObservedObject, you can also create custom ones or use third-party libraries. 
- You can create custom ones like:
```
extension UserDefaults {
    @UserDefault(key: "has_seen_app_introduction", defaultValue: false)
    static var hasSeenAppIntroduction: Bool
}
```
- Use third party ones like ValidatedPropertyKit and Burritos.

## 20. Can you give useful examples of enum associated values?
- You can use associated values to store additional information.
```
enum Marks {
    case gpa(Double, Double, Double)
    case grade(String, String, String)
}
```
- apply names to associated values
```
enum Weather {
    case sunny
    case cloudy(coverage: Int)
    case windy(speed: Int)
    case rainy(chance: Int)
}
```

## 21. How would you explain closures to a new Swift developer?
- Closures are self-contained blocks of functionality that can be passed around and used in your code.
- Swift closures have concise syntax:
    Inferring parameter and return types.
    Implicit returns for single-expression closures.
    Shorthand argument names.
- Closures are commonly used for:
    Sorting arrays (e.g., using sorted(by:)).
    Asynchronous tasks (e.g., completion handlers).
    Custom operations (e.g., mapping, filtering).

## 22. What are generics and why are they useful?
- Generics in Swift allow you to write flexible and reusable code that works with multiple types.
```
func displayData<T>(data: T) {
    print("Generic Function:")
    print("Data Passed:", data)
}

// Usage examples
displayData(data: "Swift") // String
displayData(data: 5)       // Int
```
```
// Create a generic class
class Information<T> {
    // Property of type T
    var data: T
    
    // Initialize with data of type T
    init(data: T) {
        self.data = data
    }
    
    // Method that returns a value of type T
    func getData() -> T {
        return self.data
    }
}

// Initialize the generic class with Int data
var intObj = Information<Int>(data: 6)
```

## 23. What are multi-pattern catch clauses?
- Multi-pattern catch clauses allow you to handle multiple error cases using a single catch block.
You separate different error patterns with commas within the catch block.
```
do {
    // Perform a network operation
} catch NetworkError.notConnected, NetworkError.timeout {
    print("Network issue occurred")
}
```
- Combine multi-pattern catch with nested patterns:
```
do {
    // Your code
} catch NetworkError.timeout {
    print("Request timed out")
} catch NetworkError.notConnected, _ {
    print("Network issue occurred")
}
```

## 24. What does the @main attribute do?
- The @main attribute in Swift is a feature introduced in Swift 5.3. It designates a specific type as the entry point for program execution, providing an alternative to using a top-level code file for execution
- Entry Point:
    When you mark a type (usually a struct, class, or enum) with @main, Swift treats it as the starting point for your app.
    It replaces the need for a traditional main.swift file or the @UIApplicationMain attribute (used in UIKit-based apps).
- Single Entry Point:
    Only one type in your app can be marked with @main.
    This ensures a single entry point, simplifying the app’s structure and avoiding ambiguity.
- No Explicit main() Method:
    Unlike the traditional main.swift approach, you don’t need an explicit main() method.
    Swift generates the necessary code behind the scenes.
- Example:
    In an iOS app, you can mark your AppDelegate with @main:
    ```
    import UIKit

    @main
    class AppDelegate: UIResponder, UIApplicationDelegate {
        // Your app-specific code here...
    }
    ```

## 25. 
- The #available syntax in Swift is a powerful feature for checking the availability of APIs, features, or platform versions at compile-time. Here’s how it works:

- Conditional Compilation:
    The #available attribute allows you to write code paths that are executed only when certain conditions are met.
    It ensures that your app works correctly on different iOS or macOS versions.
- Syntax:
```
if #available(platform name version, ...) {
    // Use the new APIs
} else {
    // Use the older APIs
}
```
You specify the platform (e.g., iOS, macOS), the minimum version, and any additional conditions.
Example:
Suppose you want to execute specific code only on iOS 15 and newer:
```
if #available(iOS 15, *) {
    print("This code runs on iOS 15 and up")
} else {
    print("This code runs on iOS 14 and lower")
}
```
- Compile-Time Checking:
    The compiler ensures that the code inside the #available block is valid for the specified platform and version.
    It prevents human errors related to unsupported APIs.

## 26. What is a variadic function?
- a variadic function allows you to accept a variable number of arguments of the same type.
- define a variadic parameter with `...`
```
func printNumbers(_ numbers: Int...) {
    for number in numbers {
        print(number)
    }
}
```

## 27. What is the difference between weak and unowned?
- A weak reference is optional. It doesn’t keep the referenced object alive.
    When the object it points to is deallocated, the weak reference automatically becomes nil.
    Use weak when it’s valid for the reference to become nil during its lifetime (e.g., delegate references).
- An unowned reference is non-optional. It assumes the referenced object will never be nil.
    If you access an unowned reference that happens to be nil, it will crash your program.
    Use unowned when you’re certain the reference will always be valid (e.g., parent-child relationships).

## 28. What is the difference between an escaping closure and a non-escaping closure?
- A non-escaping closure is called within the function it’s passed to before the function returns.
    It doesn’t outlive the function’s scope.
    Common use cases:
    Immediate execution of a closure (e.g., sorting an array).
    Simple transformations or computations.
- An escaping closure is a closure that outlives the function it’s passed to.
    It can be stored and executed later, even after the function has returned.
    Common use cases:
    Asynchronous operations (e.g., waiting for API responses).
    Storing closures in properties or global variables.
```
func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
    // Perform asynchronous data fetching...
    // Call 'completion' when data is available
}
```

## 29. What is the difference between an extension and a protocol extension?
- An extension allows you to add functionality to an existing type (e.g., a class, struct, or enum).
    You can extend types you don’t own (including built-in types) to add new methods, computed properties, initializers, and more.
    Extensions are useful for organizing code, separating concerns, and avoiding class bloat.
- A protocol extension adds default implementations and computed properties to protocols.
    When a type conforms to a protocol, it automatically gains the functionalities provided by the protocol extension.
    Use protocol extensions to provide shared behavior across multiple types conforming to the same protocol.


## 30. When would you use the defer keyword in Swift?
- defer is a scope inside a function that gets called before exiting the function.
```
// Suppose you open a file, perform some operations, and need to close it afterward:
func processFile() {
    let file = openFile()
    defer {
        closeFile(file)
    }
    // Perform file-related operations...
}

```

## 31. How would you explain key paths to a new Swift developer?
- Key paths allow us to reference properties of an object in a type-safe manner.
- Instead of using property names as strings (which can lead to runtime errors), key paths provide a safer way to access properties.
- `let nameKeyPath = \Person.name`
- You can use key paths for:
    Sorting arrays.
    Filtering data.
    Key-value observing (KVO).
    Dynamic property access.
```
// Use keypath with protocols
protocol Identifiable {
    var id: String { get }
}
let idKeyPath = \Identifiable.id
```

## 32. What are conditional conformances?
- They allow a type to conform to a protocol only under specific conditions.
```
protocol Purchaseable {
    func buy()
}
struct Book: Purchaseable {
    func buy() {
        print("You bought a book")
    }
}
// this is how to write a stuct that conforms to Equatable and <T> conditionally conforms to Equatable.
struct Box<T>: Equatable where T: Equatable {
    var value: T
}
```

## 33. What are opaque return types?
- They allow you to hide implementation details about a value’s type while still providing a clear interface.
- Instead of specifying a concrete return type, we use the some keyword
```
protocol Shape {
    func draw() -> some String
}
```
- Problem They Solve:
    Consider a module that draws ASCII art shapes. The Shape protocol requires a draw() function that returns the string representation of the shape.
    The challenge: How can we hide the exact return type (e.g., String) while still providing a useful interface?

## 34. What are result builders and when are they used in Swift?
- What Are Result Builders?
    A result builder can be seen as an embedded domain-specific language (DSL) for collecting parts that get combined into a final result.
    It’s a way to create a result by combining multiple expressions into a single value.
    
- Example: SwiftUI Views
```
struct ContentView: View {
    var body: some View {
        // all of this is a result builder
        // vstack and text are both combined to create a single View result
        VStack {
            Text("Hello World")
            // Other views...
        }
    }
}
```
- Result builders improve code readability by allowing you to express complex structures more naturally.

## 35. What does the targetEnvironment() compiler condition do?
- The targetEnvironment() compiler condition in Swift allows us to compile different sets of code based on whether we’re targeting the simulator or physical devices.
```
#if targetEnvironment(simulator)
    // Code specific to the simulator
    print("Running in the simulator")
#else
    // Code for physical devices
    print("Running on a physical device")
#endif
```

## 36. What is the difference between self and Self?
- self:
    self refers to the current instance of a class, struct, or enum.
    It’s used within an instance method or initializer to access properties, methods, or other members of the same instance.
```
struct Person {
    var name: String

    func introduce() {
        print("Hello, my name is \(self.name)")
    }
}
```
- Self:
    Self (with a capital ‘S’) refers to the type itself (the class, struct, or enum).
    It’s used in a static context (e.g., static methods, computed properties, or initializers) to refer to the type rather than an instance.

## 37. When would you use @autoclosure?
- In Swift, an @autoclosure offers a way to write cleaner code by allowing you to omit curly braces {} when working with a function that takes a closure argument
- Example:
Suppose you have a function that takes a closure as its argument:
Swift

```
func example(_ performAction: () -> Void) {
    performAction()
}
```
AI-generated code. Review and use carefully. More info on FAQ.
Calling this function with a closure that prints out a string requires curly braces:

`example({ print("Hello, world!") })`

However, using an autoclosure, you can simplify it:
```
func example(_ performAction: @autoclosure () -> Void) {
    performAction()
}
example(print("Hello, world"))
```
