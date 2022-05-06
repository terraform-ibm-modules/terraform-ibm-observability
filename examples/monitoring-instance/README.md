# Module sysdig monitor instance

This module is used to create sysdig monitor instance.

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "sysdig" {
  name = var.resource_group
}

module "monitoring_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/monitoring-sysdig"

  source            = "../../modules/monitoring-sysdig"
  provision         = var.provision
  bind_key          = var.bind_key
  name              = var.name
  resource_group_id = data.ibm_resource_group.sysdig.id
  plan              = var.plan
  region            = var.region
  service_endpoints = var.service_endpoints
  enable_platform_metrics = var.enable_platform_metrics
  tags              = var.tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
  key_name          = var.key_name
  key_tags          = var.key_tags
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
