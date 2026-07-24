```ts
// base64Binary
data: z.string();

// ISO 8601 datetime string, format: YYYY-MM-DD<>T<>HH:MM:SS<timezone>
creation: z.iso.datetime(); 
// 2026-07-24T10:30:00Z
// 2026-07-24T10:30:00.123Z
// 2026-07-24T10:30:00+05:30

// ISO 8601 calendar date
creation: z.iso.date() // format: YYYY-MM-DD
// 2026-07-24
```