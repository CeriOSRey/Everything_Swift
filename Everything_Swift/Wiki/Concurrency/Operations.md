# Operations for Concurrency in Swift

- Operations is an abstract class
    - needs to be subclassed. Can not be used directly

- Types of subclasses
    - BlockOperation - out of the box
    - NSInvocationOperation - out of the box **Only in Obj-C**
    - custom operation

- Built on top of GCD
- over kill for trivial task

- Use when:
    - Use when we are interested in the state of execution.
    - We want more functionalities for controlling the task.
    - We want to introduce dependencies in between tasks.
    - We want to encapsulate a block of functionality which can be reused.

- Operation Queue states
    - `open var isRead: Bool { get }`
    - `open var isExecuting: Bool { get }`
    - `open var isCancelled: Bool { get }`
    - `open var isFinished: Bool { get }`

- When operation is done executing, You cant use the same instance to execute the operation again. 
- Operations naturally run synchronously
- `BlockOperation().completionBlock = {}` to run code after completion of task.

- For custom operation. run your code by overriding the main()
- to run the task outside of the main thread, override the start() and create a thread inside it that calls the main().
    - `Thread.init(block: main).start()`
    - **It is not recommended to deal directly with the thread class..DO NOT DO THIS**
    - use below instead
         ```let operationQueue: OperationQueue = OperationQueue()
            let operation1: BlockOperation = BlockOperation()
            operationQueue.addOperation(operation1)```

- `operationQueue.maxConcurrentOperationCount = 1` 
    - limits the amount of item concurrently running to 1
    - this will make the operation serial

- operation1.addDependency(operation2)
    - adding dependency
    - operation2 will wait for operation1 to be done.
    - makes the operations serial as well
