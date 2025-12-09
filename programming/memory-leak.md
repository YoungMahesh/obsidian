A memory leak in programming happens when a program **allocates memory but never releases it** even after that memory is no longer needed
Over time program consumes more and more memory, which can eventually lead to **slow performance, system crashes, out-of-memory errors**, etc


#### What causes memory leaks?

##### 1. Forgetting to free allocated memory (Manual memory management)
```c
int* p = malloc(sizeof(int));
// use p
// forgot to free(p); → memory leak
```

##### 2. Losing references to objects (Garbage-collected languages)
Languages like Java, Python, JavaScript doesn't need manual freeing -- but leaks still occur when you **keep references unintentionally**, preventing garbage collection
```js
let arr = [];
function fill() {
  arr.push(new Array(1000000)); // arr grows forever
}
```

##### 3. Long Lived collections
Memory leaks often happen when objects stay inside:
- global variables
- static lists/maps
- caches
- event listeners

##### 4. Unremoved Event listeners / Callbacks
```js
button.addEventListener("click", handler);
// never remove → leaks if button removed from DOM
```


##### 5. Closures holding unnecessary data
A [[closure]] might keep variables alive event when not needed

```js
// Version with memory-leak
function createBigClosure() {
  const bigData = new Array(10_000_000).fill("x"); // ~10 million items

  return function smallFunction() {
    console.log("Doing something...");
  };
}

const fn = createBigClosure();

// bigData is no longer needed, but...
fn(); 
```

```js
// version with no memory-leak
function createBigClosure() {
  let bigData = new Array(10_000_000).fill("x");

  function smallFunction() {
    console.log("Doing something...");
  }

  bigData = null; // 🔥 release memory manually

  return smallFunction;
}

const fn = createBigClosure();
fn();
```

