#  Enumeration

- A common type for a group of related values

```
enum CompassPoint {
    case north
    case south
    case east
    case west
}

var directionToGoTo: CompassPoint = .east

enum planets {
case mercury, venus, earth, mars
}

```

- Swift enums dont have int values set by default to their cases. Unlike C

- Iterating over Enumeration cases - conform to CaseIterable protocol

```
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
```

- Associated Values - you can set a constant or variable to a case and check for the value later
```
enum BarCode {
case upc(Int, Int, Int, Int)
case qrCode(String)
}

var productBarcode = Barcode.upc(8, 203, 454, 1)
productBarcode = .qrCode("qelwkjraosidf")
```
