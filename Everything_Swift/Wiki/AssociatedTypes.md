# Associated Types

- If you want to make the protocol more generic

- example of protocol with associatedType
``` 
protocol SomeProtocol {
    associatedType SomePlaceholderType

    func someFunctionUsing(type: SomePlaceholderType)
    func someOtherFunctionReturning() -> SomePlaceholderType
}

protocol Container {
    associatedType Item: Equatable
    mutating func append(_ item: Item)
    var count: Int {get}
    subscript(i: Int) -> { get }
}
```

- example of object conforming to the protocol above
```
struct SomeStruct: SomeProtocol {
    typealias SomePlaceholder = Int

    func someFunctionUsing(type: Int) {

    }

    func someOtherFunctionReturning() -> Int {
        return 0
    }
}
```