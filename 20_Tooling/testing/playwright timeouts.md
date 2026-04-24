Playwright has **multiple layers of timeouts**, and understanding how they interact is key to avoiding flaky tests. Think of them as a hierarchy—from global test limits down to individual actions.

---
# 🧭 1. Test Timeout (highest level)

This is the **maximum time a single test can run**.
You write:

```ts
test.setTimeout(30_000);
```

**inside your test file**, and specifically **within the scope where you want it to apply**.

Here are the exact places you can use it 👇

### 1. Inside a single test (most specific) - when **only one test is slow**
```ts
import { test, expect } from '@playwright/test';

test('my slow test', async ({ page }) => {
  test.setTimeout(30_000); // applies ONLY to this test

  await page.goto('https://example.com');
});
```

#### Test.slow:
`test.slow()` in Playwright is a shortcut to mark a test as “expected to take longer”—and Playwright automatically increases its timeout (usually 3×).
It’s cleaner than manually tweaking timeouts in many cases.
```ts
test('example', async ({ page }) => {
  test.slow();
});
```

### 2. Inside a `describe` block (group of tests) - when **a group of tests needs more time**
```ts
import { test, expect } from '@playwright/test';

test.describe('slow tests', () => {
  test.setTimeout(30_000); // applies to ALL tests inside this block

  test('test 1', async ({ page }) => {});
  test('test 2', async ({ page }) => {});
});
```

### 3. At the top of the file (all tests in file) - when **every test in the file is slow**
```ts
import { test, expect } from '@playwright/test';

test.setTimeout(30_000); // applies to entire file

test('test 1', async ({ page }) => {});
test('test 2', async ({ page }) => {});
```

### 4. Globally in config:
```ts
// playwright.config.ts
export default {
  timeout: 30_000,
};
```

👉 Includes: test body, hooks (`beforeEach`, `afterEach`), fixtures

If this is hit → **test fails immediately**, no matter what action is running.

---

# ⏱️ 2. Expect Timeout (assertions)

Used for **auto-retrying assertions**.
```ts
await expect(locator).toBeVisible({ timeout: 5000 });
```

Global config:
```ts
expect: {
  timeout: 5000
}
```

👉 Behavior:
* Retries until condition is met or timeout hits
* Does NOT fail immediately

---

# 🖱️ 3. Action Timeout

Controls time for **user actions** like:

* `click()`
* `fill()`
* `check()`
* `hover()`

```ts
await page.click('#btn', { timeout: 10_000 });
```

Global config:
```ts
use: {
  actionTimeout: 10_000
}
```

👉 Includes:
* waiting for element to appear
* waiting to become actionable (visible, stable, enabled)

---

# 🌐 4. Navigation Timeout

Applies to:
* `page.goto()`
* `page.waitForNavigation()`
* `page.reload()`

```ts
await page.goto('https://example.com', { timeout: 15_000 });
```

Global:
```ts
use: {
  navigationTimeout: 15_000
}
```

👉 Covers: network load, page lifecycle events (like `load`, `domcontentloaded`)

---

# 🔎 5. Locator Timeout (implicit via actions & expect)

Locators themselves don’t have a separate config, but they:

* **auto-wait** internally
* use:
  * actionTimeout (for actions)
  * expect timeout (for assertions)

Example:
```ts
await page.locator('#item').click();
```

This will wait automatically before failing.

---

# 🧪 6. Fixture Timeout

Used when defining custom fixtures:
```ts
test.use({
  myFixture: async ({}, use) => {
    // setup
    await use(value);
    // teardown
  }
});
```

You can control timeout:
```ts
test.use({
  timeout: 20_000
});
```

👉 Applies to: setup, teardown

---

# 🔁 7. Hook Timeout (beforeAll / afterAll)

Hooks share the **test timeout by default**, but you can override:
```ts
test.beforeAll(async () => {
  // long setup
}, { timeout: 60_000 });
```

---

# ⏳ 8. Global Timeout (entire test run)

Limits total execution time of the whole suite:

```ts
export default {
  globalTimeout: 60 * 60 * 1000 // 1 hour
};
```

👉 If exceeded, Playwright stops all tests

---
# 🧩 9. API Request Timeout

For `request` context:
```ts
await request.get('/api', { timeout: 5000 });
```

---

# ⚙️ 10. Browser Launch Timeout

Controls how long Playwright waits for browser to launch:
```ts
chromium.launch({ timeout: 30_000 });
```

---

# 🧠 How They Work Together (Important)

Example:
```ts
test('example', async ({ page }) => {
  await page.goto('https://site.com'); // navigationTimeout
  await page.click('#btn');            // actionTimeout
  await expect(page.locator('#msg')).toBeVisible(); // expect timeout
});
```

BUT all of this must fit inside:

👉 **test timeout**

So hierarchy:

```
globalTimeout
   └── test timeout
         ├── hook timeout
         ├── action timeout
         ├── navigation timeout
         └── expect timeout
```


---

# 🚀 Mental Model

* **Test timeout** = overall budget
* **Action timeout** = UI interaction patience
* **Navigation timeout** = page load patience
* **Expect timeout** = assertion retry patience

