# Why JavaScript Numbers Can Be Dangerous for Financial Applications

JavaScript has a single numeric type called `Number`, which is based on the IEEE-754 double-precision floating-point standard. While this format is efficient and suitable for most calculations, it is not designed for exact decimal arithmetic.

A common example is:

```javascript
0.1 + 0.2
// 0.30000000000000004
```

Many developers are surprised by this result. The reason is that values such as `0.1` and `0.2` cannot be represented exactly in binary floating-point format. Instead, JavaScript stores the closest possible approximation, and small errors can appear during calculations.

For everyday applications, these tiny inaccuracies are usually harmless. However, in financial systems they can become a serious problem. Consider a payment platform processing millions of transactions. Even a small rounding discrepancy can lead to incorrect balances, reconciliation failures, reporting inconsistencies, or audit issues.

For example:

```javascript
const amount = 100.10 + 100.20;
console.log(amount);
// 200.29999999999998
```

A banking system, insurance platform, or payment processor cannot tolerate such inaccuracies.

## The Role of Decimal Libraries

Libraries such as `decimal.js` solve this problem by implementing arbitrary-precision decimal arithmetic. Instead of relying on JavaScript's floating-point representation, they store and operate on decimal values exactly.

Using `decimal.js`:

```javascript
import Decimal from 'decimal.js';

const result = new Decimal('0.1')
  .plus('0.2');

console.log(result.toString());
// 0.3
```

The calculation produces the mathematically correct result because the values are represented as decimals rather than binary floating-point numbers.

## Best Practices

For applications that handle money, taxes, interest rates, insurance claims, or accounting data:

1. Never use `FLOAT` or `DOUBLE` database types for monetary values.
2. Avoid performing financial calculations using JavaScript `Number`.
3. Store amounts either as:
   * Integer minor units (e.g., cents, paise), or
   * Database `DECIMAL` columns.
4. Use a decimal arithmetic library such as `decimal.js` when calculations involve decimal values.
5. Convert values to JavaScript `Number` only when precision is no longer important, such as for simple display purposes.

## Conclusion

JavaScript's `Number` type is excellent for general-purpose programming but unsuitable for exact financial arithmetic. When money is involved, precision matters more than convenience. Using database `DECIMAL` types, integer minor units, and libraries such as `decimal.js` helps ensure that financial calculations remain accurate, predictable, and auditable.
