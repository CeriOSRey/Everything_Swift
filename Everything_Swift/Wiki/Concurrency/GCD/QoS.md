# Quality of Service (QoS)

    - User Interactive - Involved in updating UI ie. animation
    - User Initiated - Immediate Results ie. data required for seamless user experience
    - Utility - Long running tasks - user is aware of the progress
    - Background - Not visible to user - user is not aware of the task/progress

- Global Queue Attributes
    - .concurrent
    - .serial default
    - .initiallyInactive - you can call .activate on the queue later on.
    - you can pass them in an arrays [.concurrent, .initiallyInactive]