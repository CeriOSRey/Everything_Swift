# Protocols

```
protocol SomeProtocol {
    var someString: String {get set}
    func someMethod()
}
```

- a blueprint for anything conforming to it
- an object can conform to many protocols

- Delegate: is a pattern or a method to pass data
    - delegate has to be weak, to do this, the protocol has to conform to *AnyObject* so it can have a reference count and then it can be weak
    - the origin of the data will only need an instance of the protocol so it can call the method inside the protocol.
    - the destination of the data will need to conform to protocol and have the method implementation and set the delegate.

- add *optional* keyword to the methods to make them **not** required but you also need to annotate the protocol and the method with *@objc*
- the above is not the prefered way. The prefered way is to put an empty implementation of the method inside an extension of the protocol. 
- **default implementation inside an extension of the protocol will get overriden if the object confroming to the protocol has its own implementation**

- you can combine two or more protocols by making a protocol and conforming to other protocols that contains the methods.


