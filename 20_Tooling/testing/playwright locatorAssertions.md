https://playwright.dev/docs/api/class-locatorassertions

The LocatorAssertions class provides assertion methods that can be used to make assertions about the Locator state in the tests.

### toBeVisible()

Ensures that Locator points to an attached and visible DOM node.
To check that at least one element from the list is visible, use locator.first().
```ts
await expect(page.getByText('Welcome')).toBeVisible();
```

### toContainClass()

Ensures the Locator points to an element with given CSS classes. All classes from the asserted value, separated by spaces, must be present in the Element.classList in any order.

```html
<div class='middle selected row' id='component'></div>
```

```ts
const locator = page.locator('#component');
await expect(locator).toContainClass('middle selected row');
await expect(locator).toContainClass('selected');
await expect(locator).toContainClass('row middle');
```

### toHaveClass()

Ensures the Locator points to an element with given CSS classes. When a string is provided, it must fully match the element's class attribute.

```html
<div class='middle selected row' id='component'></div>
```

```ts
const locator = page.locator('#component');
await expect(locator).toHaveClass('middle selected row');
await expect(locator).toHaveClass(/(^|\s)selected(\s|$)/);
```

### toContainText()

Ensures the Locator points to an element that contains the given text. All nested elements will be considered when computing the text content of the element. You can use regular expressions for the value as well.

```ts
const locator = page.locator('.title');
await expect(locator).toContainText('substring');
await expect(locator).toContainText(/\d messages/);
```


### toHaveText()

Ensures the Locator points to an element with the given text. All nested elements will be considered when computing the text content of the element. You can use regular expressions for the value as well.

```ts
const locator = page.locator('.title');
await expect(locator).toHaveText(/Welcome, Test User/);
await expect(locator).toHaveText(/Welcome, .*/);
```

### toHaveValue()

Ensures the Locator points to an element with the given input value. You can use regular expressions for the value as well.

```ts
const locator = page.locator('input[type=number]');
await expect(locator).toHaveValue(/[0-9]/);
```

### toHaveValues()

Ensures the Locator points to multi-select/combobox (i.e. a select with the multiple attribute) and the specified values are selected.

```html
<select id="favorite-colors" multiple>
  <option value="R">Red</option>
  <option value="G">Green</option>
  <option value="B">Blue</option>
</select>
```

```ts
const locator = page.locator('id=favorite-colors');
await locator.selectOption(['R', 'G']);
await expect(locator).toHaveValues([/R/, /G/]);
```

### not

Makes the assertion check for the opposite condition.

```ts
await expect(locator).not.toContainText('error');
```

