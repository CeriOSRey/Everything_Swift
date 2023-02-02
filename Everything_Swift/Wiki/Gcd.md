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

- Quality of Service (QoS)bb
    - User Interactive - Involved in updating UI ie. animation
    - User Initiated - Immediate Results ie. data required for seamless user experience
    - Utility - Long running tasks - user is aware of the progress
    - Background - Not visible to user - user is not aware of the task/progress

- Global Queue Attributes
    - .concurrent
    - .serial default
    - .initiallyInactive - you can call .activate on the queue later on.
    - you can pass them in an arrays [.concurrent, .initiallyInactive]

- Target Queue
    - A queue that your custom queue will use behind the scene
    - a dispatch queues priority is inherited from its target queue
    - if we dont specify a QOS for our target queue, "default priority global queue" is the default

- Auto Release Frequency
    - .inherit - inherit from target queue (default behaviour)
    - .workItem - individual auto release pool
    - .never - never setup an individual auto release pool

- DispatchQueue.global().sync - May or may not run on main thread depending on availability.

# Dispatch Group

- 
