# Type Casting

- Type casting is a way to check the type of an instance or to treat that instance as a different superclass or subclass from somewhere else in its own heirarchy

- Typecasting is implemented *is* and *as* operators

- Checking type is done with (**is**)
```
for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
```

- Downcasting is done with (**as**)
```
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}
```

- Swift provides two special types for working with nonspecific types:

    - **Any** can represent an instance of any type at all, including function types.

    - **AnyObject** can represent an instance of any class type.