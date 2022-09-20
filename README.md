# AZURE-VM-TOMCAT: create a Tomcat Apache server in an Azure tenant

## Requirements

You need first a valid client secret to let interact Terraform within Azure, basically, resources.

```bash
export SUBSCRIPTION_ID="xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx"
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/$SUBSCRIPTION_ID"
```

Many information are displayed. You have to use environment variables in order Terraform to use the client secret.

```bash
# Terraform uses the following information to interact securely with Azure
export ARM_CLIENT_ID="xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx"
export ARM_CLIENT_SECRET="xxxxxxxxxxxx"
export ARM_TENANT_ID="xxxxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxxx"
export ARM_SUBSCRIPTION_ID="xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx"
```

Reload your bash and then, you are ready to go on.

- Create the initial Azure storage for the Terraform backend state file. Use the script "init-tf-backend-state.sh" located in the scripts directory.
- Add your own environment variables for the backend state:

```bash
# Terraform: variables used to store the backend state
export TFSTATE_RG_NAME="rg-terraform-state-cb002"
export TFSTATE_SA_NAME="tfstate5686"
```

Then, use terraform init command with the following parameters:

```bash
terraform init -backend-config="resource_group_name=${TFSTATE_RG_NAME}" \
    -backend-config="storage_account_name=${TFSTATE_SA_NAME}"

terraform plan

terraform apply
```

You should see the following:

```text
Apply complete! Resources: 12 added, 0 changed, 0 destroyed.

Outputs:

public_ip_address = "xx.xx.xx.xx"
resource_group_name = "xxxxxxx"
tls_private_key = <sensitive>
```
