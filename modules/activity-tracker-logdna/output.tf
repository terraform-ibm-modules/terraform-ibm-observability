#####################################################
# Activity Tracker as a service
# Copyright 2020 IBM
#####################################################

<<<<<<< HEAD
output "tracker_id" {
  description = "Activity tracker id"
  value       = ibm_resource_instance.at_instance.id
=======
output "id" {
  description = "Activity tracker id"
  value       = var.provision ? concat(ibm_resource_instance.at_instance.*.id, [""])[0] : concat(data.ibm_resource_instance.activity_tracker.*.id, [""])[0]
>>>>>>> Ob root module (#10)
}

output "guid" {
  description = "The GUID of the activity tracker"
<<<<<<< HEAD
  value       = ibm_resource_instance.at_instance.guid
=======
  value       = var.provision ? concat(ibm_resource_instance.at_instance.*.guid, [""])[0] : concat(data.ibm_resource_instance.activity_tracker.*.guid, [""])[0]
}

output "key_id" {
  description = "Activity tracker key id"
  value       = concat(ibm_resource_key.activity_tracker_key.*.id, [""])[0]
}

output "key_guid" {
  description = "Activity tracker key guid"
  value       = concat(ibm_resource_key.activity_tracker_key.*.guid, [""])[0]
}

output "key_credentials" {
  description = "Activity tracker key credentials"
  value       = concat(ibm_resource_key.activity_tracker_key.*.credentials, [""])[0]
>>>>>>> Ob root module (#10)
}
