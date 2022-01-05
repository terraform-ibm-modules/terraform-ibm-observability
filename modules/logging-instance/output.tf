#####################################################
# Logging service instance
# Copyright 2020 IBM
#####################################################

output "id" {
  description = "ID of activity tracker instance"
  value       = var.is_provision_logging ? concat(ibm_resource_instance.logging_instance.*.id, [""])[0] : concat(data.ibm_resource_instance.logging_instance.*.id, [""])[0]
}

output "guid" {
  description = "The GUID of the logging STS instance"
  value       = var.is_provision_logging ? concat(ibm_resource_instance.logging_instance.*.guid, [""])[0] : concat(data.ibm_resource_instance.logging_instance.*.guid, [""])[0]
}

output "key_id" {
  description = "Activity tracker instance key id"
  value       = concat(ibm_resource_key.logging_key.*.id, [""])[0]
}

output "key_guid" {
  description = "Activity tracker instance key guid"
  value       = concat(ibm_resource_key.logging_key.*.guid, [""])[0]
}

output "key_credentials" {
  description = "Key credentials for super-tenant activity tracker instance"
  value       = concat(ibm_resource_key.logging_key.*.credentials, [""])[0]
}