#####################################################
# Monitoring service instance
# Copyright 2020 IBM
#####################################################

output "id" {
  description = "ID of monitoring instance"
  value       = var.is_provision_monitoring ? concat(ibm_resource_instance.sysdig_instance.*.id, [""])[0] : concat(data.ibm_resource_instance.sysdig.*.id, [""])[0]
}

output "guid" {
  description = "GUID of the monitoring instance"
  value       = var.is_provision_monitoring ? concat(ibm_resource_instance.sysdig_instance.*.guid, [""])[0] : concat(data.ibm_resource_instance.sysdig.*.guid, [""])[0]
}

output "key_id" {
  description = "Monitoring instance key id"
  value       = concat(ibm_resource_key.sysdigKey.*.id, [""])[0]
}

output "key_guid" {
  description = "Monitoring instance key guid"
  value       = concat(ibm_resource_key.sysdigKey.*.guid, [""])[0]
}

output "key_credentials" {
  description = "Monitoring instance key credentials"
  value       = concat(ibm_resource_key.sysdigKey.*.credentials, [""])[0]
}
