#####################################################
# Logging-logdna  Instance
# Copyright 2020 IBM
#####################################################

output "id" {
  description = "The ID of the logdna instance"
  value       = var.provision ? concat(ibm_resource_instance.logdna_instance.*.id, [""])[0] : concat(data.ibm_resource_instance.logdna.*.id, [""])[0]
}

output "guid" {
  description = "The GUID of the logdna instance"
  value       = var.provision ? concat(ibm_resource_instance.logdna_instance.*.guid, [""])[0] : concat(data.ibm_resource_instance.logdna.*.guid, [""])[0]
}

output "key_id" {
  description = "ID of the logdna instance key"
  value       = concat(ibm_resource_key.logdnaKey.*.id, [""])[0]
}

output "key_guid" {
  description = "logdna key guid"
  value       = concat(ibm_resource_key.logdnaKey.*.guid, [""])[0]
}

output "key_credentials" {
  description = "logdna key credentials"
  value       = concat(ibm_resource_key.logdnaKey.*.credentials, [""])[0]
}