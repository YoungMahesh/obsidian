### Matching inside locator

You can chain methods that create a locator, like page.getByText() or locator.getByRole(), to narrow down the search to a particular part of the page.

In this example we first create a locator called product by locating its role of listitem. We then filter by text. We can use the product locator again to get by role of button and click it and then use an assertion to make sure there is only one product with the text "Product 2".
```js
const product = page.getByRole('listitem').filter({ hasText: 'Product 2' });
await product.getByRole('button', { name: 'Add to cart' }).click();
await expect(product).toHaveCount(1);
```

You can also chain two locators together, for example to find a "Save" button inside a particular dialog:
```js
const saveButton = page.getByRole('button', { name: 'Save' });
// ...
const dialog = page.getByTestId('settings-dialog');
await dialog.locator(saveButton).click();
```


### Matching two locators simultaneously

Method locator.and() narrows down an existing locator by matching an additional locator. For example, you can combine page.getByRole() and page.getByTitle() to match by both role and title.
```js
const button = page.getByRole('button').and(page.getByTitle('Subscribe'));
```
