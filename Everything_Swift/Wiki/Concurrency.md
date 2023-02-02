# Concurrency in Swift

- Synchronous vs Async
    - sync blocks the main thread while async does now. Async runs on background thread
- Serial Queue vs Concurrent Queue
    - serial is one task at a time, concurrent queue is multiple tasks in different thread at the same time
    - We as developers must follow FIFO rules even in concurrent queues.
    - Will task A start before task B in concurrent Queues? yes depending on how we handle it dispatch groups.
- Serial vs Synchronous and Concurrent vs Async
    - serial/concurrent refers to the queue
    - sync and async refers to the thread

- default attribute for DispatchQueue is .serial

- How to make multiple API calls
    - DispatchGroup
    - Zip operator in combine - if api calls fails it will not send the data to the observers
    - Semaphores
    - Barriers

- Difference between GCD and Operation Queue
    - GCD is lower level API
    - Operation Queue is built on top of it
    - Operation Queue gives more control like pause, stop, resume etc.
    - OperationQueue is more complex but with more control
    - You can cancel the task in GCD by using DispatchWorkItem()

- How can you make an operation asynchronous?
    - write a class that inherits from Operation class
    - 

- How do you add dependencies between tasks?
    - in Operation plug it in between pause and resume
    - in GCD use barriers and semaphores

- How to make a class thread safe
    - Use barriers and semaphores to handle asynchronousity

- What else is thread safe other than structs
    - Actors

- Can you update the UI on background thread?
    - No, 
    - UIKit is tied to main thread.
    - Graphics rendering is synchronous. process state comes before rendering state. if Graphics is not available then nothing to render.
