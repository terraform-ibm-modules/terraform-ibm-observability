# Module logging-logdna

This template by default provision a logging instance alone (by default `is_sts_instance` = false). If you want to set up Logging Super Tenant Sender (STS) instance configure following parameters

## Provison a normal logging instance

```
`provision` = true
`is_sts_instance` = false
`service_supertenant` = null
`provision_key` = null
```

## Provison STS logging instance

```
`provision` = true
`is_sts_instance` = true
`service_supertenant` = <Name of logging sts service supertenant>
`provision_key` = <Logging provision key>
```

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "logdna" {
  name = var.resource_group
}

module "logging_sts_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/logging-logdna"

  source            = "./../../modules/logging-sts-instance"
  provision         = var.provision
  bind_key          = var.bind_key
  sts_instance_name      = var.sts_instance_name
  resource_group_id = data.ibm_resource_group.logdna.id
  plan              = var.plan
  region            = var.region
  service_endpoints = var.service_endpoints
  service_supertenant    = var.service_supertenant
  provision_key          = var.provision_key
  tags              = var.tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
  key_name = var.key_name
  key_tags = var.key_tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
