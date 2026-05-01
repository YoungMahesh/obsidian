- https://playwright.dev/docs/test-assertions


Playwright includes test assertions in the form of expect function. 
To make an assertion, call expect(value) and choose a matcher that reflects the expectation. There are many generic matchers like toEqual, toContain, toBeTruthy that can be used to assert any conditions.

### Auto-retrying assertions
These will retry until the assertion passes, or the assertion timeout is reached. Note that retrying assertions are async, so you must await them.

| Assertion                                                                                                                             | Description                       |
| ------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------- |
| [await expect(locator).toBeVisible()](https://playwright.dev/docs/api/class-locatorassertions#locator-assertions-to-be-visible)<br>   | Element is visible                |
| [await expect(locator).toHaveText()](https://playwright.dev/docs/api/class-locatorassertions#locator-assertions-to-have-text)         | Element matches text              |
| [await expect(locator).toContainText()](https://playwright.dev/docs/api/class-locatorassertions#locator-assertions-to-contain-text)   | Element contains text             |
| [await expect(page).toHaveURL()](https://playwright.dev/docs/api/class-pageassertions#page-assertions-to-have-url)                    | Page has a URL                    |
| [await expect(locator).toContainClass()](https://playwright.dev/docs/api/class-locatorassertions#locator-assertions-to-contain-class) | Element has specified CSS classes |
| [await expect(page).toHaveTitle()](https://playwright.dev/docs/api/class-pageassertions#page-assertions-to-have-title)                | Page has a title                  |
