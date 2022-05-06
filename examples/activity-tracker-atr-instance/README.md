# Module activity_tracker

This module is used to provision a activity tracker as a service

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "res_group" {
  name = var.resource_group
}

###################################################################
# Activity tracker ATS instance
###################################################################

module "activity_tracker_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-logdna"

  source                 = "./../../modules/activity-tracker-instance"
  provision              = var.provision
  is_ats_instance        = false
  name                   = var.name
  plan                   = var.plan
  region                 = var.region
  bind_key               = var.bind_key
  key_name               = var.key_name
  key_tags               = var.key_tags
  resource_group_id      = data.ibm_resource_group.res_group.id
  tags                   = var.tags
  //ATS specific
  service_supertenant    = ""
  associated_logging_crn = ""
  provision_key          = ""
  create_timeout         = var.create_timeout
  update_timeout         = var.update_timeout
  delete_timeout         = var.delete_timeout
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
