# Dispatch Semaphore

- Difference between barrier
    - with barrier we stop all other tasks 
    - while semaphores we gives each task exclusive access to the resource one at a time.

- Critical section: a shared resource which is accessed by multiple parts of the app at the same time and cause race conditions.
- resolve by giving each tasks exclusive access one at a time. You do this with Semaphores.
- wait() decrements the counter by 1
- signal() increments the counter by 1

- How it works
    - there will be a queue of threads containing the tasks
    - there is a counter variable which is user defined and is 0 or higher.
    - if a thread access the **critical section** the dev should call **wait()** which will reduced the counter by 1
    - once the job of the above thread is done, the dev should call **signal()** which will increment the counter by 1
    - the access to the **critical section** is allowed only if the value of the counter is greater than -1
