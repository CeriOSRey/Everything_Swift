# Dispatch Group

- Multiple tasks can be grouped together
- We can either wait for the group tasks to be finished or can continue with other tasks and get notified when group tasks completes.
- when count of enter() == leave() then all tasks are done.

- 4 essential methods of DispatchGroup
    - enter() - start a task
    - leave() - finish a task
    - wait() - wait for all the task to be done, can set a timeout on the wait 
    - notify() - notify when all tasks are  done

- wait() will block the thread. **Do not use in main thread.**