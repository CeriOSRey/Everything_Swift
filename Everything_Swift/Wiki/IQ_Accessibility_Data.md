#  Interview Questions:

# Accessibility

## 1. How much experience do you have testing with VoiceOver?
- Adding these modifiers will add accessibility to the views.
Labels:
Use `accessibilityLabel(_:)` to add a label that describes the view’s contents.
You can also use accessibilityInputLabels(_:) to set alternate input labels.
Example: `Text("Submit").accessibilityLabel("Submit button")`
Values:
Use `accessibilityValue(_:)` to add a textual description of the value that the view contains.
Example: `Slider(value: $sliderValue).accessibilityValue("\(sliderValue)")`
Hints:
Communicate what happens after performing the view’s action using `accessibilityHint(_:).`
Example: `Button("Save", action: saveData).accessibilityHint("Saves the changes")`
Actions:
Add an accessibility action to the view using accessibilityAction(_:).
Example: `Button("Delete", action: deleteItem).accessibilityAction(.delete)`

## 2. Explain Dynamic Typing
- dynamic typing in Swift with Any and AnyObject allows developers to handle cases where the types of variables or constants may vary during runtime, offering a balance between type safety and flexibility in programming.
- Any: Can represent an instance of any type at all, including function types.
- AnyObject: Can represent an instance of any class type.
- Use type casting with `as` Keyword
- Generics are checked in compile time while Any and Anyobjects are checked in runtime.

## 3. What are main problems we need to solve when making accessible apps?
- Supporting alternative input methods beyond touch interactions, such as voice commands, gestures, and adaptive switches. This ensures that users with motor disabilities can interact with the app effectively.
- Managing focus states effectively.
- Ensuring that developers are aware of accessibility guidelines.

## 4. What accommodations have you added to apps to make them more accessible?
- added accessibility descriptions to images and background images.

# Data

## 5. Define a Dictionary an Array and a Set and how they differ?
- `Dictionaries` are key value pair
- `Array` are an ordered list of values. Order of elements is maintained based on the index.
- `Set` is a list of unique elements.
- Accessing elements in an `array` are done with index while keys for `dictionaries` and actual values for `Set`.

## 6. What are the main differences between `classes` and `structs` in Swift?
- Making another instance of a struct creates a copy while creating another instance of a class creates a reference. Changes to a class also changes the original.
- `Classes` are prefered when you want to take advantage of reference semantics and `Obj-C` interoperability. `Structs` are prefered for simpler data structure and also for their immutability when declared as let (properties cant be changed unlike classes), thread safety and copy on write behaviour.
- Memory Location: Value types store data directly where they are defined (stack for local variables, or inline for structs). Reference types store a reference (pointer) to data stored elsewhere (heap).
- Copy vs. Reference: Assigning or passing a value type creates a new independent copy of the data. Assigning or passing a reference type creates a new reference to the same shared data.
- Mutability: Changes to one instance of a value type do not affect other instances. Changes to one instance of a reference type may affect other instances sharing the same data.

## 7. What are tuples and why are they useful?
- `Tuples` are a way of grouping values with different types. They are usefull in few cases ie. multiple returns or creating a simple data structure.

## 8. What does the `Codable` protocol do?
- `Encodable` - serialization - convert swift custom type to external type ie. JSON
- `Decodable` - deserialization - covernt external type ie. JSON to swift custom type
- `Codable` - to cover both `Encodable` and `Decodable`.

example of using CodingKeys
```
struct Person: Codable {
    var name: String
    var age: Int
    var city: String
    
    enum CodingKeys: String, CodingKey {
        case name = "firstName" // Use "firstName" for encoding and decoding "name"
        case age
        case city
    }
}
```

## 9. What is the difference between an array and a set?
- Use `Array` if you need to preserve the order of the elements and use `Set` when you want to ensure uniqueness.

## 10. What is the difference between the Float, Double, and CGFloat data types?
- `Float` are 32 bit floating point type. means lower precision than Double
- `Double` are 64 bit and more precise
- `CGFloat` are used for graphics programming, in 32 devices its equal to `Float` and equal to `Double` in 64 bit devices.

## 11. What’s the importance of key decoding strategies when using Codable?
- Swift code typically follows camelCase for property names while external data may follow snakeCase
- Key Decoding Strategies: Allow customization to match the external key naming conventions to the Swift code’s naming conventions.

## 12. When using arrays, what’s the difference between map() and compactMap()?
- map() preserves optionals in its result, while compactMap() removes nil values by unwrapping optionals.

## 13. Why is immutability important?
- immutability - when there are no states there are no changes and no of change side effects 

## 14. What are one-sided ranges and when would you use them?
- represent ranges where one end is open-ended (unbounded).
One-Sided Range: Can omit either the start or end point to denote an unbounded range:

From Start: `..<5` represents the range from the beginning up to but not including 5.
To End: `3...` represents the range from 3 to the end, inclusive.

## 15. What does it mean when we say “strings are collections in Swift”?
- `Strings` conform to `Collection` protocol, which means they behave to `Collection` types ie. `Array`. Can call methods in the `Collection` protocol.

## 16. What is a UUID, and when might you use it?
- It is typically represented as a 36-character string, formatted into five groups of hexadecimal digits separated by hyphens (e.g., 123e4567-e89b-12d3-a456-426614174000).
- Generated by calling `UUID()`
 
## 17. When would you use Swift’s Result type?
- Generally used in asynchronous functions that can fail and you want to handle both success and failure case.
- Type safe because you define the type as you put down the Result type

## 18. What is type erasure and when would you use it?
- type erasure is a powerful technique in Swift for creating type-erased wrappers that allow you to work with types of unknown specifics in a uniform manner. It promotes abstraction, encapsulation, and flexibility, making it particularly useful in protocol-oriented programming and when dealing with generics and associated types.
ie.
```
// Generic protocol
protocol Fetcher {
    associatedtype DataType
    func fetchData() -> DataType
}

// Concrete type
struct StringFetcher: Fetcher {
    func fetchData() -> String {
        return "Fetched String"
    }
}

// type erasure implementation that hides the concrete type
struct AnyFetcher<T>: Fetcher {
    private let _fetchData: () -> T
    
    // Here we dont see the StringFetcher being called but we are using it's method
    init<F: Fetcher>(_ fetcher: F) where F.DataType == T {
        _fetchData = { fetcher.fetchData() }
    }
    
    func fetchData() -> T {
        return _fetchData()
    }
}

// Usage:
let fetcher = AnyFetcher(StringFetcher())
let fetchedString = fetcher.fetchData() // "Fetched String"

```

