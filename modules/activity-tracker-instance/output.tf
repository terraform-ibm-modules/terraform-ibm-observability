#####################################################
# Activity Tracker service instance
# Copyright 2020 IBM
#####################################################

output "id" {
  description = "ID of activity tracker instance"
  value       = var.is_provision_activity_tracker ? concat(ibm_resource_instance.activity_tracker.*.id, [""])[0] : concat(data.ibm_resource_instance.activity_tracker.*.id, [""])[0]
}

output "guid" {
  description = "The GUID of the activity tracker"
  value       = var.is_provision_activity_tracker ? concat(ibm_resource_instance.activity_tracker.*.guid, [""])[0] : concat(data.ibm_resource_instance.activity_tracker.*.guid, [""])[0]
}

output "key_id" {
  description = "Activity Tracker instance key id"
  value       = concat(ibm_resource_key.activity_tracker_key.*.id, [""])[0]
}

output "key_guid" {
  description = "Activity Tracker instance key guid"
  value       = concat(ibm_resource_key.activity_tracker_key.*.guid, [""])[0]
}

output "key_credentials" {
  description = "Key credentials for super-tenant activity tracker instance"
  value       = concat(ibm_resource_key.activity_tracker_key.*.credentials, [""])[0]
}
