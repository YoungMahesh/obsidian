Playwright has a small set of core concepts, but they fit together in a very intentional way. 

---

## 1. Browser, Context, Page (Execution Model)


![Image](https://images.openai.com/static-rsc-4/s1Kji61iBsqgoQgJBFO-54fQztnDIgzMs5DcsRX0LcUJk3QNJuzjJwtGgGv0FOYinombqtlKjnpQRIP3PACV_NFmmzvTBvAGtzUtCcdKZpOKgubIdfJOQpFIacxjn-zbH6WK3xa1fI62IMMLABdOaWt6Ll0P1KMJ7cogf52rU0eDUGjd7S1qZHyXRtjRrb4c?purpose=fullsize)


![Image](https://images.openai.com/static-rsc-4/GIYILIIk0ld_4XwQZGtMa7Z5EF3zdDqq7q9lQkP1i2UDzCrPlkhI9jnyDhTWFzvXVqhwcv9OE-hCcIGgJqdwiBTWq-dkLCq2M1sEVvPHxUX7F0pLYo8XyaI1G7L-snKchS67Lh6k1csM9ek3eT4Xl2NO4JQgDtXUHTJrfFEXMNid3DZvmB0QfoylVUtoW3uE?purpose=fullsize)



Think of this as the hierarchy:

* **Browser** → the actual browser (Chromium, Firefox, WebKit)
* **Context** → an isolated session (like incognito tabs, no shared cookies/storage)
* **Page** → a tab inside a context

Example:

```ts
const browser = await chromium.launch();
const context = await browser.newContext();
const page = await context.newPage();
```

👉 Why it matters:

* Contexts allow **parallel tests with isolation**
* Pages are where all interactions happen

---

## 2. Selectors & Locator (The Heart of Playwright)

### Selector

Locator = selector + behavior + lifecycle management
Selector = just a string query
Locator is a separate abstraction built on top of selectors
You can replace almost all selector usage with locators
Playwright’s recommended style = locator-first

```ts
// #subbmit string is selector
// with selector
await page.click('#submit');

// with locator
await page.locator('#submit').click();
```

👉 Always prefer locators over raw selectors.

### Locator

A **locator** is how you *find elements*, but more importantly, it’s **lazy + auto-waiting**.

```ts
const button = page.getByRole('button', { name: 'Submit' });
```

Key properties:

* **Lazy** → element is not resolved immediately
* **Auto-retry** → waits until element is ready
* **Strict by default** → expects one match

### Types of locators

* `getByRole()` ✅ (recommended, accessible)
* `getByText()`
* `getByLabel()`
* `getByTestId()`
* `locator('css=...')` (low-level)

👉 Mental model:

> Locator = “a smart query that keeps trying until it works”

---

## 3. Actions (What You Do)

Actions simulate user behavior:

```ts
await button.click();
await page.getByLabel('Email').fill('test@example.com');
```

Common actions:

* `.click()`
* `.fill()`
* `.type()`
* `.hover()`
* `.check()` / `.uncheck()`
* `.selectOption()`
* `.press()`

### Auto-waiting magic

Before performing an action, Playwright ensures:

* Element is **visible**
* Element is **enabled**
* Element is **stable (not moving)**

👉 This is why you rarely need manual waits.

---

## 4. Assertions (Validation)

Assertions verify expected outcomes using `expect`.

```ts
await expect(page.getByText('Success')).toBeVisible();
```

Types:

* **Element assertions**

  * `toBeVisible()`
  * `toHaveText()`
  * `toBeEnabled()`
* **Page assertions**

  * `toHaveURL()`
  * `toHaveTitle()`

### Auto-retry assertions

Assertions retry until timeout:

```ts
await expect(locator).toHaveText('Done');
```

👉 This replaces:

* `sleep`
* manual polling
* flaky checks

---

## 5. Auto-Waiting (Core Philosophy)

Playwright automatically waits for:

* Elements to appear
* Conditions to be satisfied
* Network to settle (in some cases)

You don’t do:

```ts
await page.waitForTimeout(5000); ❌
```

Instead:

```ts
await expect(locator).toBeVisible(); ✅
```

👉 This is the biggest shift from Selenium-style testing.

---

## 6. Timeouts (Important for Stability)

[[playwright timeouts]]

## 7. Test Runner (Structure & Execution)

Playwright comes with its own test runner:

```ts
import { test, expect } from '@playwright/test';

test('login test', async ({ page }) => {
  await page.goto('/login');
});
```

Features:

* Parallel execution
* Retries
* Fixtures (like `page`, `context`)
* Hooks (`beforeEach`, `afterEach`)

---

## 8. Fixtures (Dependency Injection)

Fixtures provide pre-built objects:

```ts
test('example', async ({ page }) => {
  await page.goto('/');
});
```

You can create custom fixtures:

* authenticated user
* preloaded data
* API clients

---

## 9. Page Object Model (Optional Abstraction)

Instead of writing raw locators everywhere:

```ts
class LoginPage {
  constructor(private page: Page) {}

  email = this.page.getByLabel('Email');
  password = this.page.getByLabel('Password');

  async login(email, password) {
    await this.email.fill(email);
    await this.password.fill(password);
  }
}
```

👉 Helps with:

* reuse
* maintainability

---

## 10. Network & API Testing

Playwright isn’t just UI:

```ts
await page.route('**/api/*', route => route.abort());
```

or:

```ts
const response = await request.get('/api/data');
```

You can:

* mock APIs
* inspect requests
* test backend directly

---

## 11. Debugging & Trace Viewer

Playwright has strong debugging tools:

* `--debug`
* `page.pause()`
* Trace Viewer (visual timeline of test)

---

## How Everything Connects

Here’s the full flow:

1. **Page** → where test runs
2. **Locator** → finds element
3. **Action** → interacts
4. **Assertion** → verifies

```ts
await page.getByRole('button', { name: 'Login' }).click();
await expect(page.getByText('Welcome')).toBeVisible();
```

---

## The Mental Model

If you remember just one thing:

> Playwright = “Locators + Auto-waiting + Assertions”

Everything else (timeouts, retries, fixtures) exists to support that.

---
