# InvisiMe
> A template app to demonstrate deployment to Azure using Terraform

## Setup

1. Clone repository by running following command

```sh
git clone https://github.com/jayolin/invisime.git
```

2. Install dependencies by running following command

```sh
cd invisime
yarn
```

3. Install [Terraform](https://developer.hashicorp.com/terraform/install) and [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) if you already haven't

4. Log on to the Azure Portal and create a subscription. Copy the subscription ID afterwards

5. Run the following command to obtain credentials for use in configuring Terraform

```sh
az ad sp create-for-rbac --name terraform --role='Contributor' --scopes='/subscriptions/<your-subscription-id>'
```

This should yield an output like:

```yaml
{
  "appId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "displayName": "terraform",
  "password": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "tenant": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
```

7. Once this is done, create a `terraform.tfvars` file in folder `.terraform`. File should look like this:

```json
client_id       = "<your-app-id>"
client_secret   = "<your-password>"
tenant_id       = "<your-tenant-id>"
subscription_id = "<your-subscription-id>"
```

8. Provision the app using terraform by running the following commands:

```sh
cd .terraform
terraform init
terraform plan
terraform apply
```

9. Run the following commands to build and deploy the InvisiMe app to Azure!

```sh
cd ..
yarn build
yarn deploy
```

10. Visit [Deployed App](https://invisime.z33.web.core.windows.net/) to see it in action

11. DO NOT FORGET to free up resources by calling

```sh
cd .terraform
terraform destroy
```