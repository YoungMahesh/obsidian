
## Setup REST API

https://github.com/openemr/openemr/blob/master/API_README.md#-quick-start

### Enable API
- Top bar → Admin → Config → Left bar → Connectors:
	☑ Enable OpenEMR Standard REST API
	☑ Enable OpenEMR Standard FHIR REST API
	→ Save

### Register New App

Visit: Top bar → Admin → System → API Clients → Register New App → App Registration Form

> We are creating OAuth2 connection [[Authorization Flow with PCKE implementation - website]]

Application Type: Confidential
Application Context: Multipurpose Application
App Name: name of app you are connecting
Contact Email: can keep empty
App Redirect URI: Redirect/Callback URI on app you are connection
App Launch URI: base url of your app
App Logout URI: keep empty
Scopes Requests: keep all selected
JSON Web Key Set URI: keep empty
JSON Web Key Set: `{"keys":[]}`
Does your application include any Decision Support Intervention (DSI): No DSI used

Click 'Submit'

Save and use - `Client APP ID` and `Client Secret APP ID` you get after submission

Go to "Top bar → Admin → System → API Clients" → Click on "Edit" in client name in list → Click "Enable Client"

Try connecting app with OAuth2.0 Authorization Flow with PKCE, if you face error, check docker container logs: 
`docker logs <openemr container name> --tail 10`


### create user

This user will be used to login during OAuth2 Authorization Flow

Top bar → Admin → Users → Add User → Add User form

Fill following fields
Username:
Password:
Your Password: `password of person who is creating user`
Provider: ☑
Portal: ☑
First Name: 
Last Name:
Access Control: Clinicians

Click "Save"