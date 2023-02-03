# Generics

- Makes your code reusable because you can plug in any Type.

``` func swapTwoValues<T>(_ a: inoutT, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}```

example 2: with type constraints

```func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here
}```

example 3: Where clause