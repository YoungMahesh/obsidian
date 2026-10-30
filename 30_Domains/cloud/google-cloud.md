
If you does not have 'billing account' account or your 'billing account' is currently closed in google-cloud, then you will not be charged by google-cloud for any services you are using, as you are part of free-tier in this case.

### projects

Shut down project: three-dots on top right corner -> project settings -> 'shut down'  in top row

### cloud shell
Google Cloud Shell is a temporary Linux development environment provided by Google Cloud, accessible directly from your browser.
Cloud Shell is tightly integrated with your Google account.
Your **IAM permissions** still apply. Cloud Shell doesn't magically give you administrator access.
Cloud Shell is associated with your Google account, not with a specific Google Cloud project.

Editor:
If you click 'open-editor', you will get vs-code like editor placed on top of cloud shell. In editor, you can click 'Open Terminal' to switch back to terminal
You can use this editor (or cloud shell) for maximum 50 hours / week . You can check current hours consumed by clicking (in editor) top-right 'session information' -> 'Usage Quota'
You get `2 vCPUs; 7.8 GiB RAM; 50GB peristant storage`. This is **free** to use.

```bash
# switch active project
gcloud config set project PROJECT_A
# get name of currently active project
gcloud config get-value project

# get project-id from `gcloud projects list`
gcloud asset search-all-resources \
  --scope="projects/PROJECT_ID"

gcloud projects list
gcloud compute instances list
```