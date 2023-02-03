# Some keyword or Opaque Type

- Opaque type is used when we want to hide the concrete type of the object returned by a function
- **some** keyword can also be used to return the Parent protocol type that the return object is conforming to

- the returned type conforms to Sequence protocol, so we can use **some Sequence** instead as the return type.
```
func squareArrayElements<T: Numeric>(array: Array<T>) -> LazyMapSequence<Array<T>, T> {
    return array.lazy.map { $0 * $0 }
}

func squareArrayElements<T: Numeric>(array: Array<T>) -> some Sequence {
    return array.lazy.map { $0 * $0 }
}
```
- **We can not hide the concrete type of a protocol with an associatedType inside because it can't keep track of the type of the associatedType.**
- to get around this. We use Opaque type, Use the keyword **some** to return a opaque type:
    ```
    func getUserCard() -> some Card {

    }
    ```
