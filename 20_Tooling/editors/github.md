- [Account access to Third party](https://github.com/settings/applications)


## Create new app

Visit github.com/settings/apps/new and fill the form:
1. Github app name
2. Homepage URL: Documentation of github app or Main site where github app is going to be used
3. Redirect URL: The redirect endpoint used to return authorization codes if your app implements OAuth / "user-to-server" flows. Github will send authorization codes for user-repositories to this URL
4. Setup URL: Users will be redirected to this URL after installing your GitHub App to complete additional setup.
5. Webhook URL: Specifies your server's endpoint where GitHub will POST event payloads.
6. Webhook Secret: GitHub hashes the payload using HMAC-SHA256 and your shared secret, attaching the result in the X-Hub-Signature-256 header. Your server recomputes the HMAC using the same secret; if the signatures do not match, the payload was altered or forged and can be safely rejected.

## Token Generation

### Token for creating pull request

1. https://github.com/settings/personal-access-tokens
2. Fine grained tokens -> Generate new token
3. Repository access -> Select repositories
4. Permisssions
	1. Contents: Read and write
	2. Pull requests: Read and write
5. Generate Token


