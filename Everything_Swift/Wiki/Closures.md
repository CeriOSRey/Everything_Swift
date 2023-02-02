#  Closures

- self contained blocks of functionality that can be passed around and used in your code.
- can capture and store references to any constants and variables from the context in which they are defined.

```
{ (parameters) -> returnType in 
    statements
}
```

- Swift Closures are clean and clear - 
    ```names.sorted(by: { (s1: String, s2: String) -> Bool in 
        returns s1 > s2
    }
    ```
    - inferring parameter and return value types from context
        `reservedNames = names.sorted(by: {s1, s2 in return s1 > s2})`
    - implicit returns from single-expression closures
        `reservedNames = names.sorted(by: {s1, s2 in s1 > s2})`
    - shorthand argument names $0, $1
        `reservedNames = names.sorted(by: {$0 > $1})`
    - trailing closure syntax
        `reversedNames = names.sorted() { $0 > $1}` becomes `reservedNames = names.sorted { $0 > $1}`
    - operator syntax
        `reservedNames = names.sorted(by: >)`

# Escaping closures
- escapes a function when the closure is passed as an argument to the function, but is called after the function returns. If you dont add @escaping you would get a compiler error.
```
func someFuncWithEscapingClosure(completionHanlder: @escaping () -> Void) {
    completionHandler()
}
```
- **add [weak self] before the parameters to ensure weak reference to self, if self is referenced inside the closure.**

# Autoclosures
- An autoclosure is a closure that’s automatically created to wrap an expression that’s being passed as an argument to a function. It doesn’t take any arguments, and when it’s called, it returns the value of the expression that’s wrapped inside of it.

```
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"
```