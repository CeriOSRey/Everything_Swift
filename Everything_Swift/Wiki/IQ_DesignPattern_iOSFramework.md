#  Design Patterns

## 1. How would you explain delegates to a new Swift developer?
- an object that acts on behalf of, or in coordination with, another object. It allows one object to delegate tasks, actions, or responsibilities to another object.

Benefits of Delegates:
Modularity: Separates responsibilities and promotes a clean architecture by allowing objects to specialize in specific tasks.

Flexibility: Enables customization and behavior extension without tightly coupling classes together.

Readability: Improves code readability and maintainability by organizing responsibilities based on protocol conformance.

## 2. Can you explain MVC, and how it's used on Apple's platforms?
- Model is separated out from the Controller but the view and business logic sits inside the controller.

## 3. Can you explain MVVM, and how it might be used on Apple's platforms?
- Data is separated out in the model
- Business logic is separated out in the view-model
- view is in the view controller

## 4. How would you explain dependency injection to a junior developer?
- Dependencies are objects or services that a class needs to perform its function. For example, a NetworkManager might depend on an APIService to fetch data from a server.
- Instead of creating these dependencies internally, DI involves passing them to the dependent class from the outside. This makes the class more flexible and reusable because it can work with different implementations of its dependencies.

Types of Dependency Injection:
Constructor Injection: Dependencies are passed through the class's initializer

Property Injection: Dependencies are injected through public properties of the class. This allows for optional dependencies or dependencies that can change over time.

Method Injection: Dependencies are passed into methods as parameters. This is useful for methods that need specific dependencies for a single operation.

Benefits:
Flexibility: Classes are not tied to specific implementations of their dependencies. Different implementations (e.g., mock objects for testing) can be injected depending on the context.

Testability: Easier unit testing by injecting mock dependencies that simulate different scenarios (e.g., network errors, empty responses) without making actual network calls.

Maintainability: Improves code maintainability by decoupling components and reducing dependencies between classes.

## 5. How would you explain protocol-oriented programming to a new Swift developer?
- protocols are used to define a blueprint of methods, properties, and other requirements that conforming types (classes, structs, enums) must implement. It encourages the composition of behavior through protocols rather than inheritance.

- Protocols are blue prints for an object to follow.
- To make a function optional for the objects to follow, create a default implementation of the function in a protocol extension

## 6. What experience do you have of functional programming?
- First-Class and Higher-Order Functions: Functions are treated as first-class citizens. You can pass them as arguments or return them from other functions.
- Closures: Swift closures are self-contained blocks of functionality. They can capture and store references to variables and functions.

## 7. Can you explain KVO, and how it's used on Apple's platforms?
- allows you to observe changes to specific properties without tightly coupling components.
- key looks like this `\.objectToObserve.myDate`

## 8. Can you give some examples of where singletons might be a good idea?
- Configuration Managers: A singleton can manage app-wide configuration settings. For example, a SettingsManager that handles user preferences or theme settings.
- Resource Managers: Singletons can manage shared resources like database connections, network clients, or file caches. For instance, an ImageCache singleton could handle caching images across different parts of your app.
- Logging and Analytics: A singleton logger or analytics tracker can centralize logging or tracking events. It ensures consistent behavior and avoids creating multiple loggers or trackers.
- Dependency Injection: In some cases, singletons can serve as a lightweight form of dependency injection. For instance, a ServiceLocator singleton could provide access to various services (e.g., APIs, databases) throughout your app.
- Application State: A singleton can manage global app state. For example, a AppState singleton could track whether the app is in the foreground/background or handle app-wide notifications.

## 9. What are phantom types and when would you use them?
- allow you to add extra information to your types without actually affecting their implementation.

# iOS Framework

## 1. How do you create your UI layouts – storyboards or in code?
- With storyboards there is a risk of merge conflicts, to resolve, use isolate your work in its own storyboard.
- with Code, you dont have a visual representation of your work. 

## 2. How would you add a shadow to one of your views?
- UIKit
```
view.layer.shadowColor = UIColor.black.cgColor
view.layer.shadowOpacity = 0.2
view.layer.shadowOffset = CGSize(width: 4, height: 4)
view.layer.shadowRadius = 5
```
- SwiftUI
```
Text("Hacking with Swift")
    .padding()
    .shadow(radius: 5)
    .border(.red, width: 4)
    .background(.white)

```

## 3. How would you round the corners of one of your views?
- UIKit: `view.layer.cornerRadius = 10`
- SwiftUI:
```
Text("Round Me")
    .padding()
    .background(.red)
    .cornerRadius(15)

```
or 
```
Text("Round Me")
    .padding()
    .background(.red)
    .clipShape(Capsule())

```

## 4. What are the advantages and disadvantages of SwiftUI compared to UIKit?
- Advantages of SwiftUI:
    Declarative Syntax: SwiftUI uses a declarative syntax, making it easier to read and understand.
    Developers describe how the UI should look, similar to Jetpack Compose in Android.
    Code is concise and expressive.
    Efficient Development:
    SwiftUI streamlines development with its modern approach.
    Quick market entry and cross-platform capabilities are possible.
    Ideal for rapid prototyping and smaller projects.
    Integration with UIKit:
    SwiftUI can be mixed with UIKit using UIHostingController.
    Allows gradual adoption and smoother migration from UIKit to SwiftUI.
- Disadvantages of SwiftUI:
    Limited iOS Version Support:
    SwiftUI is available only from iOS 13 onwards.
    If you need to support older iOS versions, you’re limited to UIKit.
- Advantages of UIKit:
    Maturity and Community Support:
    UIKit has been around for years and has a mature ecosystem.
    Extensive community resources, libraries, and best practices.
    Fine-Grained Customization:
    UIKit provides more control over UI elements.
    Developers can fine-tune details and handle complex scenarios.
    Performance-Critical Applications:
    For performance-critical apps (e.g., games, complex animations), UIKit remains a reliable choice.
    
## 5. What do you think is a sensible minimum iOS deployment target?
- iOS 13 and Later:
    iOS 13 introduced SwiftUI and other significant improvements.
    Choosing iOS 13 as the minimum target allows you to leverage modern features and APIs.
    Most users have upgraded to iOS 13 or later.
- iOS 12:
    If you need broader compatibility, consider iOS 12.
    Keep in mind that some features (like SwiftUI) won’t be available.
- Market Research:
    Analyze your app’s potential user base.
    Check iOS adoption rates to make an informed decision.
    
## 6. What features of recent iOS versions were you most excited to try?
- The Info.plist file in an iOS or macOS app contains essential configuration settings. Here are some key items you’d typically find in it:

- Bundle Identifier: This unique identifier ties your app to its provisioning profile and App Store listing.
- App Icons and Launch Screens: Specify how your app’s icon appears on the home screen and define the launch screen (splash screen) settings1.
- Localization Information: Localize strings like CFBundleDisplayName, CFBundleName, and usage descriptions for protected resources.
- Platform- and Device-Specific Keys: You can add platform- or device-specific keys using syntax like [key name]-[platform]~[device] (e.g., UISupportedInterfaceOrientations~ipad for iPad orientation settings)

## 7. What is the purpose of size classes?
-  Size Classes categorize devices based on their screen sizes. Instead of designing layouts for each individual device, you design for a set of predefined Size Classes. This makes your interface adaptable to a wide range of devices with similar characteristics1. Essentially, Size Classes help create adaptive user interfaces that work seamlessly across different screen sizes and orientations2.

## 8. What happens when Color or UIColor has values outside 0 to 1?
- If you set a color component value below 0.0 or above 1.0, it will be automatically clamped to the valid range.
- If you set a color component value significantly outside the valid range (e.g., a very large positive or negative value), it may cause overflow or underflow issues.
- Overflow: Extremely large values might wrap around or behave unexpectedly.
- Underflow: Very small negative values might wrap around to positive values.
- If you set an alpha value outside this range, it will be clamped as well.

