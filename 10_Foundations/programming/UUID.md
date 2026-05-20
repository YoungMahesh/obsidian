A **UUID** stands for **Universally Unique Identifier**. It’s a 128-bit value used to uniquely identify something — like a user, file, database record, device, or session — without needing a central authority.

Example UUID:

```text
550e8400-e29b-41d4-a716-446655440000
```

## Why UUIDs are useful

UUIDs are designed so that the chance of generating the same one twice is extremely small.

They are commonly used in:

* Databases
* APIs
* Distributed systems
* Session IDs
* File identifiers
* Microservices


## UUID versions

There are several types:

* **UUIDv1** → based on timestamp + MAC address
* **UUIDv4** → random (most common)
* **UUIDv7** → time-ordered and modern, increasingly popular

## UUID structure


All UUID versions 1 through 7 all use the same standard textual format:
```text id="2j0s6w"
8-4-4-4-12
```

Example:
```text id="6a6khl"
550e8400-e29b-41d4-a716-446655440000
```

The textual format is just a representation.
Internally, UUID is simply: 128 bits
The version only defines, how those 128 bits are generated/interpreted.

Total:
* 32 hexadecimal characters
* 36 characters including hyphens
* 128 bits total

---

## What changes between versions?

The **internal meaning of bits** changes.

The structure stays same, but:

* timestamp bits
* random bits
* hash bits
* version bits
* node bits

are arranged differently.

---

## Version location

In all standard UUIDs:

```text id="nhz3tv"
xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx
               ^
```

`M` = version number.

Examples:

```text id="jlwm8z"
...-1xxx-...  => UUIDv1
...-4xxx-...  => UUIDv4
...-7xxx-...  => UUIDv7
```

## In programming

Python:
```python
import uuid

print(uuid.uuid4())
```

JavaScript:
```javascript
crypto.randomUUID()
```

Java:
```java
UUID.randomUUID()
```
