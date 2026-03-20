A closure is a fundamental programming concept where a **function remembers the variables from the environment in which it was created**, even after that outer function has finished executing.

> **A closure is a function + the surrounding variables it can still access


Useful in: Private variables, stateful functions, callbacks
### Example

```js
function counter() {
  let count = 0;

  return function() {
    count++;
    console.log(count);
  };
}

const c = counter();
c(); // 1
c(); // 2
c(); // 3

```

Here:
- Each call to `counter()` create a new private `count` variable
- Only returned function can access it
- This is how closures create private state

### Closures a Private variables (Why it's useful)

Closures can be used to create data hiding (encapsulation):

```js
function makeBankAccount() {
  let balance = 100;

  return {
    deposit(amount) { balance += amount },
    getBalance() { return balance }
  };
}

const acc = makeBankAccount();
acc.deposit(50);
console.log(acc.getBalance()); // 150
```

`balance` is private -- no one can modify it directly.
