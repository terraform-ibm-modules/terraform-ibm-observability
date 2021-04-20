#####################################################
# Sysdig key
# Copyright 2020 IBM
#####################################################

output "sysdig_key_id" {
  description = "The ID of the sysdig key"
  value       = ibm_resource_key.sysdigKey[0].id
}

output "sysdig_guid" {
  description = "The GUID of the sysdig instance"
  value       = ibm_resource_instance.sysdig_instance.guid
}

output "sysdig_id" {
  description = "The ID of the sysdig instance"
  value       = ibm_resource_instance.sysdig_instance.id
}
