# Model View View Model

- View - takes care of UI display and updates
- Model - raw data
- View Model - business logic
    - no UIKit, SwiftUI imports
    - How it will communicate with the View
        - delegate pattern
        - closures
        - reactive way with rx/combine
    - Testability
    - contains only business logic
- network layer