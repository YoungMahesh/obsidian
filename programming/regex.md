Regex (regular-expressions) is a mini-language for describing patterns in text

## pattern
### The 4 building blocks

1. **Literals** - exact characters
	- `a`, `cat`, `hello`
2. **Character classes** - one of many
	- `.`  → any character
	- `\d` → digit
	 - `[abc]` → a or b or c
 3. **Quantifiers** - how many times
	 - `*` → 0 or more
	 - `+` → 1 or more
	 - `{3}` → exactly 3
4. **Anchors & structures** - where
	- `^` start of string
	- `$` end of string
	- `()` grouping
### Examples
- `\d{3}` = 3 digits
- `\d*` = any one or more digits
- `^\d+$` = one or more digits and nothing else
	- ^ is start boundary, $ end boundary with only digits in between
	- this will failed `a90` or `90a` `9a0` due to present of presence of string while expected one or more digits
- `^[a-zA-Z]+$` = only one or more uppercase (A-Z) and lowercase (a-z) letters


## flags

Regex flags are single letters (like `i`, `g`, `m`, `s`, `u`) appended to a regular expression pattern (e.g. `/pattern/gi`) that modify its behavior, enabling features such as global matching, case-insensitivity

### common regex flags
- **`i` (ignoreCase)**: match case-insensitive, matching "abc", "AbC", etc
- **`g` (global)**: find all matches in the string, not just first one
- **`m` (multiline)**: changes `^`(start) and `$`(end) anchors to match start/end of each line, not just the whole string

## regex in languages

### javascript

```js
// Regex literal
// in javascript `//` act as delimiters - /regex-pattern-here/regex-flags-here
const pattern = /hello/i;

// using constructor
const pattern2 = new RegExp("hello", "i")

/hello/i.test("Hello world");   // true
pattern.test("Hello world");   // true

"abc123xyz".match(/\d+/); // ["123"]
"1a2b3c".match(/\d/g); // ["1", "2", "3"]
"2026-01-19".replace(/-/g, "/"); // "2026/01/19"
"hello world".search(/world/); // 6
```