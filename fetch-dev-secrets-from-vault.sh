#!/usr/bin/env bash
#
# Fetch secrets for local development from Azure KeyVault
# and print them to stdout as a bunch of env var exports.
# These secrets should be added to your local .env file
# to enable running integration tests locally.
#
KEY_VAULT="${1:=$containerName}"

function fetch_secret_from_keyvault() {
    local SECRET_NAME=$1

    az keyvault secret show --vault-name "${KEY_VAULT}" --name "${SECRET_NAME}" --query "value"
}

function store_secret_from_keyvault() {
    local SECRET_VAR=$1
    local SECRET_NAME=$2

    local SECRET_VALUE=`fetch_secret_from_keyvault "${SECRET_NAME}"`
    store_secret "${SECRET_VAR}" "${SECRET_VALUE}"
}

function store_secret() {
    local SECRET_NAME=$1
    local SECRET_VALUE=$2

    az keyvault secret set \
        --vault-name "$KEY_VAULT" \
        --name "$SECRET_NAME" \
        --value "$SECRET_VALUE"
}

echo "# ----------------------- "
echo "# Fetched the following secrets from ${KEY_VAULT} on "`date`


store_secret "KEY_VAULT_URI" "https://${KEY_VAULT}.vault.azure.net/"
store_secret_from_keyvault "KEY_VAULT_CLIENT_ID" "kv-sp-app-id"
store_secret_from_keyvault "KEY_VAULT_CLIENT_SECRET" "kv-sp-password"
store_secret_from_keyvault "KEY_VAULT_TENANT_ID" "kv-sp-tenant"

echo "# End of fetched secrets. "
echo "# ----------------------- "