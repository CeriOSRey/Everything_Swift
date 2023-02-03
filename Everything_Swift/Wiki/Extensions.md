#  Extensions

- Extensions are for adding new behaviour not altering current implementations
- no Stored properties in Extensions but can have computed properties

- They can
    - add computed properties
    - define instance methods and type methods
    - provide new initializers
    - define subscripts
    - define and use new nested types
    - make an existing type conform to a protocol

```
protocol someProtocol {
    var string: String = ""
}

extension someProtocol {
    var returnedString = { return "return this string "}
}
```
- Instance methods added with an extension can also modify (or mutate) the instance itself. Structure and enumeration methods that modify self or its properties must mark the instance method as mutating, just like mutating methods from an original implementation.

