#####################################################
# activity tracker as a service
# Copyright 2020 IBM
#####################################################

data "ibm_resource_instance" "activity_tracker" {
  count = var.provision ? 0 : 1

  name              = var.service_name
  location          = var.region
  resource_group_id = var.resource_group_id
  service           = "logdnaat"
}

resource "ibm_resource_instance" "at_instance" {
  count = var.provision ? 1 : 0

  name              = var.service_name
  service           = "logdnaat"
  plan              = var.plan
  location          = var.region
  resource_group_id = (var.resource_group_id != null ? var.resource_group_id : null)
  tags              = (var.tags != null ? var.tags : null)
  parameters        = (var.parameters != null ? var.parameters : null)

  timeouts {
    create = (var.create_timeout != null ? var.create_timeout : null)
    update = (var.update_timeout != null ? var.update_timeout : null)
    delete = (var.delete_timeout != null ? var.delete_timeout : null)
  }
}

resource "ibm_resource_key" "activity_tracker_key" {
  count                = var.bind_key ? 1 : 0
  name                 = var.resource_key_name
  role                 = var.role
  resource_instance_id = var.provision ? ibm_resource_instance.at_instance[0].id : data.ibm_resource_instance.activity_tracker[0].id
  tags                 = (var.resource_key_tags != null ? var.resource_key_tags : null)
}