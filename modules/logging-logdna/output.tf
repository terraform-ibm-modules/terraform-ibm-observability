#####################################################
# Logging-logdna  Instance
# Copyright 2020 IBM
#####################################################

output "logdna_instance_id" {
  description = "The ID of the logdna instance"
  value       = ibm_resource_instance.logdna_instance.id
}

output "logdna_instance_guid" {
  description = "The GUID of the logdna instance"
  value       = ibm_resource_instance.logdna_instance.guid
}

output "logdna_instance_key_id" {
  description = "The ID of the logdna instance key"
  value       = ibm_resource_key.logdnaKey[0].id
}