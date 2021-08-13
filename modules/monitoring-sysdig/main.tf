#####################################################
# Sysdig instance key
# Copyright 2020 IBM
#####################################################

<<<<<<< HEAD
locals {
  bind = var.bind_resource_key
}
=======
data "ibm_resource_instance" "sysdig" {
  count = var.provision ? 0 : 1
>>>>>>> Ob root module (#10)

  name              = var.service_name
  location          = var.region
  resource_group_id = var.resource_group_id
  service           = "sysdig-monitor"
}

resource "ibm_resource_instance" "sysdig_instance" {

<<<<<<< HEAD
=======
  count = var.provision ? 1 : 0

>>>>>>> Ob root module (#10)
  name              = var.service_name
  service           = "sysdig-monitor"
  plan              = var.plan
  location          = var.region
  resource_group_id = var.resource_group_id
  tags              = (var.tags != null ? var.tags : [])
  service_endpoints = (var.service_endpoints != "" ? var.service_endpoints : null)
  parameters        = (var.parameters != null ? var.parameters : null)

  timeouts {
    create = (var.create_timeout != null ? var.create_timeout : null)
    update = (var.update_timeout != null ? var.update_timeout : null)
    delete = (var.delete_timeout != null ? var.delete_timeout : null)
  }
}

resource "ibm_resource_key" "sysdigKey" {
<<<<<<< HEAD
  count                = local.bind ? 1 : 0
  name                 = var.resource_key_name
  role                 = var.role
  resource_instance_id = ibm_resource_instance.sysdig_instance.id
=======
  count                = var.bind_key ? 1 : 0
  name                 = var.resource_key_name
  role                 = var.role
  resource_instance_id = var.provision ? ibm_resource_instance.sysdig_instance[0].id : data.ibm_resource_instance.sysdig[0].id
>>>>>>> Ob root module (#10)
  tags                 = (var.resource_key_tags != null ? var.resource_key_tags : [])
}

