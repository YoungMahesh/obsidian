CORS stands for **Cross-Origin Resource Sharing**.

It is a browser security mechanism that controls whether a webpage from one origin can access resources from another origin.

An **origin** =:

* protocol (`http` / `https`)
* domain (`example.com`)
* port (`3000`, `8080`, etc.)

So these are different origins:

* `http://localhost:3000`
* `http://localhost:3015`
* `https://example.com`

---

## Why CORS exists

Without CORS, any website could make authenticated requests to another site using your browser cookies/session.

Example:

* You are logged into your bank
* A malicious website silently sends requests to bank APIs

CORS prevents this by making browsers block cross-origin requests unless the server explicitly allows them.

---

# Example

Frontend:

```js
fetch("http://localhost:3000/api/fhir/Patient")
```

Page is running on:

```txt
http://localhost:3015
```

Different ports = different origins.

Browser sends request, but backend must respond with headers like:

```http
Access-Control-Allow-Origin: http://localhost:3015
```

Otherwise browser blocks it.

---

# Simple Request vs Preflight Request

## Simple Request

Simple GET/POST requests are sent directly.

Example:

```js
fetch("/api/users")
```

---

## Preflight Request

For “non-simple” requests, browser first sends an `OPTIONS` request.

This is called a **preflight request**.

Example triggers:

* `PUT`
* `DELETE`
* custom headers
* `Content-Type: application/json`

Browser asks:

```http
OPTIONS /api/fhir/Patient
Origin: http://localhost:3015
Access-Control-Request-Method: POST
```

Server must reply:

```http
Access-Control-Allow-Origin: http://localhost:3015
Access-Control-Allow-Methods: GET, POST, OPTIONS
Access-Control-Allow-Headers: Content-Type
```

Then browser sends actual request.

---

# Common CORS Headers

| Header                             | Purpose                   |
| ---------------------------------- | ------------------------- |
| `Access-Control-Allow-Origin`      | Which origins can access  |
| `Access-Control-Allow-Methods`     | Allowed HTTP methods      |
| `Access-Control-Allow-Headers`     | Allowed request headers   |
| `Access-Control-Allow-Credentials` | Allow cookies/auth        |
| `Access-Control-Expose-Headers`    | Headers frontend can read |

---

# CORS handling in Next.js API routes

### 1. Handle pre-flight request from browser

A preflight request is an automatic HTTP request sent by the browser before the actual API request, to check whether the server allows that cross-origin request.
Preflight happens when request is not a "simple request", 
- e.g. when request type is `PUT`, `PATCH`, `DELETE`
- or when there are custom-headers like `Authorization: Bearer ...`
- or non-simple content-type like `Content-Type: application/json`

Browser sends an OPTIONS request first.

Example:
```http
OPTIONS /api/fhir/Patient HTTP/1.1
Origin: http://localhost:3015
Access-Control-Request-Method: POST
Access-Control-Request-Headers: Content-Type, Authorization
```

The server must respond with headers like:
```http
HTTP/1.1 204 No Content

Access-Control-Allow-Origin: http://localhost:3015
Access-Control-Allow-Methods: GET, POST, OPTIONS
Access-Control-Allow-Headers: Content-Type, Authorization
```

If allowed, browser sends the real request afterward.

Sequence:
```txt
Browser
   |
   | OPTIONS (preflight)
   v
Server
   |
   | "Yes, allowed"
   v
Browser
   |
   | Actual POST/PUT/etc request
   v
Server
```

To handle pre-flight requests in nextjs, update middleware code in nextjs as follows:
```js
if (req.method === "OPTIONS") {
  return new NextResponse(null, {
	status: 204,
	headers: {
	  "Access-Control-Allow-Origin": "*",
	  "Access-Control-Allow-Methods": "GET, OPTIONS",
	  "Access-Control-Allow-Headers": "Content-Type, Authorization",
	},
  });
}
```


### 2. Handle responses to allow CORS

Response of actual API should also include cors-headers.
```js
const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization",
};
export const GET = async (request: NextRequest) => {
  return NextResponse.json(respObj, { status: 200, headers: corsHeaders });
}
```

---

# Important

CORS is enforced by browsers only.

Server-to-server requests are not blocked by CORS.

Example:
* Node.js backend → another API → works
* Browser → another origin → CORS applies

