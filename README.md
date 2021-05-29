# terraform-kubernetes-multi-cloud
This is the production level setup for Kubernetes with goolge, azure and amazon
# Configuring Authentication

For authentication, we need to provide the Azure DevOps organization name and PAT token to the Terraform. There are many ways to provide the required information. In our case, we’ll be using below environmental variables to provide the same:

AZDO_ORG_SERVICE_URL – This is the Azure DevOps organization url.

AZDO_PERSONAL_ACCESS_TOKEN – This is the Azure DevOps organization personal access token

