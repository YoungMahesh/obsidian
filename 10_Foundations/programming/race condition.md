A race condition in programming happens when two or more threads or processes access shared data at the same time, and the final outcome depends on the timing of their execution.
Because the order of execution is unpredictable, this leads to incorrect, inconsistent, or unexpected results.


#### Example

Imagine two threads incrementing same variable:
```c
// shared
int counter = 0;

Thread A: counter = counter + 1;
Thread B: counter = counter + 1;
```

Expected result: 2

What can actually happen ?
- Both threads might read `counter = 0` at the same time 
- Both write 1
- Final result becomes 1


