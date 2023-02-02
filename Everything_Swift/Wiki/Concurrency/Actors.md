# Actors

- nonisolated keyword on a var which is a computed property is same as declaring it as a constant let
    - `nonisolated var company: String {"Company Name"}`

- Task blocks are async so then you can call await inside the block
    - ```Task {
        let bookSeat: String == await flight.bookSeat()
    }```

- to ensure a class or a function is run in the mainthread annotate with @MainActor
    - you can then call the function or calls inside any background thread w/out using dispatchQueue. **Introduced in swift 5.5**
    - ```@MainActor
        func updateUI() {
            //update UI here...
        }```