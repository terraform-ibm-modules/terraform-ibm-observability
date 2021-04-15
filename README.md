# IBM observability Terraform Module

This is a collection of modules that make it easier to provision observability services like logging, monitor and activity tracker on IBM Cloud Platform:
* [logging-logdna](modules/logging-logdna)
* [monitoring-sysdig](modules/monitoring-sysdig)
* [activity-tracker-logdna](modules/activity-tracker-logdna)

## Compatibility 

This module is meant for use with Terraform 0.13. 

## Usage

Full examples are in the [examples](./examples/) folder, but basic usage is as follows for creation of logdna instance & key:

```hcl
provider "ibm" {
}

data "ibm_resource_group" "logdna" {
  name = var.resource_group
}

module "logdna_instance" {
  source  = "terraform-ibm-modules/observability/ibm//modules/logging-logdna"
  

  bind_resource_key   = var.bind_resource_key
  service_name        = var.service_name
  resource_group_id   = data.ibm_resource_group.logdna.id
  plan                = var.plan
  region              = var.region
  service_endpoints   = var.service_endpoints
  tags                = var.tags
  resource_key_name   = var.resource_key_name
  role                = var.role
  resource_key_tags   = var.resource_key_tags
}

```

## Requirements

### Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) 0.13
- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm) 

## Install

### Terraform

Be sure you have the correct Terraform version (0.13), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

### Terraform plugins

Be sure you have the compiled plugins on $HOME/.terraform.d/plugins/

- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm) 
