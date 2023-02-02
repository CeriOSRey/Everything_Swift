# Grand Central Dispatch

- commonly known as Dispatch Queues
- Types of Queues
    - main
    - global
    - custom queues

- Main Queue
    - system created
    - serial
    - uses Main Thread
    - UIKit is tied to Main Thread, so all UI related operations must be performed on Main Queue

- Global Concurren Queues
    - system created
    - Concurrent
    - Do not use Main Thread
    - priorities are affected by QoS parameter

- Target Queue
    - A queue that your custom queue will use behind the scene
    - a dispatch queues priority is inherited from its target queue
    - if we dont specify a QOS for our target queue, "default priority global queue" is the default

- Auto Release Frequency
    - .inherit - inherit from target queue (default behaviour)
    - .workItem - individual auto release pool
    - .never - never setup an individual auto release pool

- DispatchQueue.global().sync - May or may not run on main thread depending on availability.


