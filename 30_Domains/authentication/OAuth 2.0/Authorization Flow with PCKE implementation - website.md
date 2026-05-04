
The standard PKCE flow (Backend-for-Frontend (BFF) pattern):
```
Browser → Backend → Authorization Server

1. User clicks login
2. Backend generates:
   - code_verifier
   - code_challenge
3. Backend redirects browser to auth server

4. User logs in

5. Auth server redirects to:
   https://your-backend.com/callback  ✅

6. Backend:
   - receives authorization code
   - uses stored code_verifier
   - exchanges code → tokens

7. Backend creates session (HTTP-only cookie)

8. Backend redirects browser → frontend (logged-in state)
```


Test:
Select Project in: https://console.cloud.google.com/
search 'Credentials' 
click 'Create Credential' -> 'OAuth Client'