# Module sysdig monitor instance

This module is used to grant a user or service ID permissions to work with the IBM Cloud Monitoring with Sysdig service:

## Example Usage
```
provider "ibm" {
}

module "access_group" {
  source  = "terraform-ibm-modules/iam/ibm//modules/access-group"

  name         = var.name
  tags         = var.ag_tags
  description  = var.description
}

module "access_group_policy" {
  source               = "terraform-ibm-modules/iam/ibm//modules/access-group-policy"
  access_group_id      = module.access_group.access_group_id
  roles                = var.roles
  tags                 = var.ag_policy_tags
  resources            = var.resources
  account_management   = var.account_management
}

module "access_group_members" {
  source            = "terraform-ibm-modules/iam/ibm//modules/access-group-members"
  access_group_id   = module.access_group.access_group_id
  ibm_ids           = var.ibm_ids
  service_ids       = var.service_ids
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs


| Name               | Description                                                      | Type         | Default | Required |
|--------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| name               | A descriptive name used to identify the access group             | string       | n/a     | yes      |
| description        | The description of the access group.                             | string       | n/a     | no       |
| ag_tags            | Tags that should be applied to the service                       | list(string) | n/a     | no       |
| roles              | list of roles.                                                   | list(string) | n/a     | yes      |
| ag_policy_tags     | list of tags that you want to add to the access group policy.    | list(string) | n/a     | no       |
| account_management | Gives access to all account management services if set to true   | bool         | false   | no       |
| resources          | A nested block describes the resource of this policy             | string       | n/a     | no       |
| service_ids        | List of service IDS add to  access group.                        | string       | n/a     | no       |
| ibm_ids            | IBM IDs that you want to add to or remove from the access group. | list(string) | n/a     | no       |

## Resources Inputs

| Name                          | Description                                                      | Type         | Default | Required |
|-------------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| service                       | service name that you want to include in your policy definition  | string       | n/a     | no       |
| resource_instance_id          | ID of resource instance of the policy definition.                | string       | n/a     | no       |
| region                        | Region of the policy definition                                  | string       | n/a     | no       |
| resource_type                 | Resource type of the policy definition.                          | string       | n/a     | no       |
| resource                      | Resource of the policy definition.                               | string       | n/a     | no       |
| resource_group_id             | ID of the resource group                                         | string       | n/a     | no       |
| attributes                    | Set resource attributes in the form of name=value,name=value     | string       | n/a     | no       |

## Usage

To create access members group run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to to remove the access group members run the command

   `terraform destroy -var-file="input.tfvars"`