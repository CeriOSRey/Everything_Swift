# DispatchWorkItem

- Encapsulate a block of code
- Can be dispatched to both DispatchQueue and DispatchedGroup
- Provides the flexibility to cancel the task (unless execution has started)

- cancel in DispatchWorkItem
    - if it is to true before execution then task wont execute
    - if work item is cancelled while executing then cancel will return true but execution will not abort
    - wait() and notify() works the same way as DispatchGroup


# DispatchWorkItemFlags
    - a set of behaviours for a work item
    - its QoS class, whether to create a barrier or spawn a new detached thread

- Different flags
    - assignCurrentContext
    - detached
    - enforceQoS
    - inheritQoS
    - noQoS
    - barrier

# DispatchWorkItemFlag.Barrier
    - cause the work item to act as a barrier block when submitted to a concurrent queue.
    - resolve race conditions by executing workItems one at a time.
