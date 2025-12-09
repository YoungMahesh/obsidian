A deadlock happens when two or more threads wait forever for each other's locks, so nobody can continue

#### Example
```
Thread A locks Resource 1 → waits for Resource 2
Thread B locks Resource 2 → waits for Resource 1
```