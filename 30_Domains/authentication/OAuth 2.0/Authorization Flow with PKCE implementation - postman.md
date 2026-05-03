https://learning.postman.com/docs/sending-requests/authorization/oauth-20
https://www.keycloak.org/getting-started/getting-started-docker


### 1. setup OAuth 2.0 provider

setup keycloack: https://www.keycloak.org/getting-started/getting-started-docker

While Client Creation, add postman redirect URL: https://oauth.pstmn.io/v1/browser-callback , in `Valid Redirect URIs` fields

**KeyCloackAuthInfo:** http://localhost:8080/realms/myrealm/.well-known/openid-configuration



### 2. gather information needed for authorization request

**Callback URL (Redirect URI)**: if you don't have your own callback url use callback url  provided by postman
Callback url by postman: https://oauth.pstmn.io/v1/browser-callback

**Auth URL**: `KeyClockAuthInfo.authorization_endpoint`
	e.g. http://localhost:8080/realms/myrealm/protocol/openid-connect/auth
	
**Access Token URL**: `KeyClockAuthInfo.token_endpoint`
	e.g. http://localhost:8080/realms/myrealm/protocol/openid-connect/token

**UserInfo URL**: `KeyClockAuthInfo.userinfo_endpoint`
	e.g. http://localhost:8080/realms/myrealm/protocol/openid-connect/userinfo
`

**Client ID**: value we given while creating client in keycloack setup, e.g. myclient
### 3. get access token by sending authorization request

open postman desktop app 
go to new request
go to authorization tab

Inside Authorization:
```
Auth Type: OAuth 2.0

Configure New Token
	Grant Type: Authorization Code (With PKCE)
	Fill fields from information above: 
	Callback URL: https://oauth.pstmn.io/v1/browser-callback
	Auth URL: http://localhost:8080/realms/myrealm/protocol/openid-connect/auth
	Access Token URL: http://localhost:8080/realms/myrealm/protocol/openid-connect/token
	Client ID: myclient
	Code Verifier: <Automatically generated if left blank>
	Scope: openid
	Code Challenge Method: SHA-256
```


Click 'Get New Access Token'

You will get 'Access Token' in response
Click 'Use Token' button in response pop-up, this will add 'Access Token' to 'Current Token'.Token field in Authorization tab



### 4. get user info using access token

Inside value of GET request in top UI paste - UserInfo URL ( http://localhost:8080/realms/myrealm/protocol/openid-connect/userinfo ) 


Confirm Authorization Fields:
- Current Token:
	- Use Token Type: Access Token
		- value: 'Access Token' got from the response above
	- Header Prefix: Bearer

Send

You will get user information.