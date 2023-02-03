# Inheritance

- Any class that doesn’t inherit from another class is known as a base class.

- Subclassing is the act of basing a new class on an existing class. The subclass inherits the characteristics of the existing class

- To override a characteristic that would otherwise be inherited, you prefix your overriding definition with the *override* keyword.
    - An overridden method named someMethod() can call the superclass version of someMethod() by calling super.someMethod() within the overriding method implementation.

    - An overridden property called someProperty can access the superclass version of someProperty as super.someProperty within the overriding getter or setter implementation.

    - An overridden subscript for someIndex can access the superclass version of the same subscript as super[someIndex] from within the overriding subscript implementation.

- You can provide a custom getter (and setter, if appropriate) to override any inherited property, regardless of whether the inherited property is implemented as a stored or computed property at source.

- You can use property overriding to add property observers to an inherited property.
```
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
```

- **You can prevent a method, property, or subscript from being overridden by marking it as final.**