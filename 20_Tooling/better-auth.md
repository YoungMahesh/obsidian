#encryption 

[Better Auth](https://better-auth.com/docs/introduction) is a framework-agnostic, universal authentication and authorization framework for TypeScript.

Generate value for `BETTER_AUTH_SECRET=`:
```bash
openssl rand -base64 32
```

Declare better-auth server and frontend:
```env
BETTER_AUTH_URL=http://localhost:3000
```

You can connect multiple frontend for better-auth server:
```env
BETTER_AUTH_TRUSTED_ORIGINS="http://localhost:3001,https://admin.example.com,https://*.modal.host"
```