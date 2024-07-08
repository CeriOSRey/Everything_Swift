# Security

## 1. How much experience do you have using Face ID or Touch ID? Can you give examples?

## 2. How would you explain App Transport Security to a new iOS developer?
- ATS ensures that network connections made by your app are secure. It achieves this by enforcing the use of the Transport Layer Security (TLS) protocol.
- TLS provides encryption, authentication, and data integrity, making it essential for protecting sensitive information during communication.
- By default, ATS is enabled for new apps. It’s crucial to follow ATS guidelines during development.
- If your app needs to connect to older servers that don’t support TLS, you can add ATS exceptions selectively. However, limit exceptions to specific domains or frameworks.
- Always prefer HTTPS over HTTP for server communication.

## 3. What experience do you have of using the keychain?
- The keychain is like a secure vault for your app. It’s where you store small pieces of sensitive user data, such as passwords or tokens.
- Storing sensitive data without encryption is risky. The keychain ensures that your data remains encrypted.
- First-Time Setup: When your app needs credentials (like a password), it prompts the user to provide them. After successful authentication, your app stores these credentials in the keychain.
- Common Case: For subsequent logins, your app retrieves the stored credentials from the keychain without bothering the user.
- Handling Changes: If the user changes credentials (e.g., resets a password), your app gracefully updates the keychain.

## 4. How would you calculate the secure hash value for some data?
- SHA-256 is widely used for its high security level and fixed-length output.
- Other algorithms like MD5, SHA-1, and CRC32 are also available for hash calculations.

# Performance

## 1. How would you identify and resolve a retain cycle?
- Use tools like Instruments Profiler or Xcode’s Memory Graph Debugger to detect potential retain cycles
- Use weak or unowned.
- weak is optional while unowned needs the property to outlast the parent will need to be initialized within the parent.

## 2. What is an efficient way to cache data in memory?
- LRU (Least Recently Used) Cache:
    LRU caches store a limited number of items and evict the least recently accessed ones when the cache is full.
    Use a data structure like a dictionary (for fast lookups) combined with a doubly linked list (to maintain access order).
    Popular libraries like NSCache (in iOS/macOS) and third-party libraries provide LRU caching.
- In-Memory Databases:
    If your app deals with structured data, consider using an in-memory database like SQLite (with an in-memory mode) or Realm.
    These databases allow efficient querying and indexing while keeping data in memory.
- Image Caching:
    For images, use specialized image caching libraries like SDWebImage or Kingfisher.
    These libraries handle asynchronous image loading, caching, and memory management.
- Custom Caching:
    Implement your own caching logic based on your app’s specific needs.
    Consider using a combination of dictionaries, arrays, or custom data structures.
    Be mindful of memory usage and periodically clear the cache.
- UserDefaults in iOS is a handy persistence layer for storing small amounts of data. It allows you to save key-value pairs persistently across app launches. 

## 3. What steps do you take to identify and resolve battery life issues?
- provide dark mode option for OLED screens
- properly manage background tasks and services
- Avoid unneccessary computations
- optimize memory usage and promptly release resources when no longer needed.
- Xcode’s Energy Usage Analyzer (for iOS) to identify energy-consuming areas.

## 4. What steps do you take to identify and resolve crashes?
- Debugging Basics:
    Use breakpoints in your code to pause execution and inspect variables.
    Employ assert() or precondition() to catch unexpected conditions.
    Write to a log to track program flow and identify issues.
- Download Crash Logs (iOS):
    Retrieve crash logs from iTunes Connect for detailed information.
    Analyze stack traces and identify problematic areas.
    
## 5. How does Swift handle memory management?
- Automatic Reference Counting (ARC)
- Manages lifecycle by incrementing an objects reference count by 1 per object referencing it and decrementing when no longer referencing. When reference count reaches 0 then that object's memory gets deallocated.

## 6. What steps do you take to identify and resolve a memory leak?
- code reviews to look for retain cycles
- Profiling tools
    Instruments in xcode to analyze memory usage and allocations/deallocations
    Look for unusual memory growth
    
## 7. What steps do you take to identify and resolve performance issues?
- Use Xcode’s Profiler:
    Xcode’s built-in Profiler is a powerful tool for analyzing and optimizing app performance.
    Measure metrics like CPU usage, memory consumption, and energy consumption.
    Identify bottlenecks and resource-intensive areas.
- Minimize Network Requests with Caching:
    Implement caching mechanisms to reduce excessive network calls.
    Cache frequently accessed data (e.g., images) locally to improve loading speed.
- Asynchronous Operations with Grand Central Dispatch (GCD) or Swift Concurrency:
    Offload time-consuming tasks from the main thread using GCD.
    Keep the UI responsive during resource-intensive operations.
- Optimize Image and Asset Sizes:
    Resize and compress images to reduce memory footprint.
    Consider using modern image formats like WebP.
- Implement Pagination for Data Display:
    Load large datasets in smaller chunks as the user interacts.
    Enhance user experience while navigating extensive lists or feeds.
- Use Core Data or Swift Data for Local Data Storage:


