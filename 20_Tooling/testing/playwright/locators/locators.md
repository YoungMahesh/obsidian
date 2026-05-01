https://playwright.dev/docs/locators

[[locators filter]]

Locators are the central piece of Playwright's auto-waiting and retry-ability. 
In a nutshell, locators represent a way to find element(s) on the page at any moment.

- `page.getByRole()` to locate by explicit and implicit accessibility attributes.
- `page.getByText()` to locate by text content.
- `page.getByLabel()` to locate a form control by associated label's text.
- `page.getByPlaceholder()` to locate an input by placeholder.
- `page.getByAltText()` to locate an element, usually image, by its text alternative.
- `page.getByTitle()` to locate an element by its title attribute.
- `page.getByTestId()` to locate an element based on its data-testid attribute (other attributes can be configured).


### Locate by role

The page.getByRole() locator reflects how users and assistive technology perceive the page, for example whether some element is a button or a checkbox. 
When locating by role, you should usually pass the accessible name as well, so that the locator pinpoints the exact element.

```html
<h3>Sign up</h3>
<label>
  <input type="checkbox" /> Subscribe
</label>
<br/>
<button>Submit</button>
```
```ts
await expect(page.getByRole('heading', { name: 'Sign up' })).toBeVisible();
await page.getByRole('checkbox', { name: 'Subscribe' }).check();
await page.getByRole('button', { name: /submit/i }).click();
```

### Locate by label

Most form controls usually have dedicated labels that could be conveniently used to interact with the form. In this case, you can locate the control by its associated label using page.getByLabel().

```html
<label>Password <input type="password" /></label>
```

```ts
await page.getByLabel('Password').fill('secret');
```


### Locate by text

Find an element by the text it contains. 
You can match by a substring, exact string, or a regular expression when using page.getByText().

```html
<span>Welcome, John</span>
```

```ts
// match by the text it contains
await expect(page.getByText('Welcome, John')).toBeVisible();

// exact match
await expect(page.getByText('Welcome, John', { exact: true })).toBeVisible();

// match with regular expression
await expect(page.getByText(/welcome, [A-Za-z]+$/i)).toBeVisible();
```


### Locate by title

Locate an element with a matching title attribute using page.getByTitle().

```html
<span title='Issues count'>25 issues</span>
```

```ts
await expect(page.getByTitle('Issues count')).toHaveText('25 issues');
```

### Locate by test id

Testing by test ids is the most resilient way of testing as even if your text or role of the attribute changes, the test will still pass. 
QA's and developers should define explicit test ids and query them with page.getByTestId(). 
However testing by test ids is not user facing. If the role or text value is important to you then consider using user facing locators such as role and text locators.

```html
<button data-testid="directions">Itinéraire</button>
```

```ts
await page.getByTestId('directions').click();
```


---

### Locate by CSS or XPath

If you absolutely must use CSS or XPath locators, you can use page.locator() to create a locator that takes a selector describing how to find an element in the page. 
Playwright supports CSS and XPath selectors, and auto-detects them if you omit css= or xpath= prefix.


```ts
await page.locator('css=button').click();
await page.locator('xpath=//button').click();

await page.locator('button').click();
await page.locator('//button').click();
```