#  Extensions

- Extensions are for adding new behaviour not altering current implementations
- no Stored properties in Extensions but can have computed properties

```
protocol someProtocol {
    var string: String = ""
}

extension someProtocol {
    var returnedString = { return "return this string "}
}
```
