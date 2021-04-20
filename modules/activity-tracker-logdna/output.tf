#####################################################
# Activity Tracker as a service
# Copyright 2020 IBM
#####################################################

output "tracker_id" {
  description = "activity tracker id"
  value       = ibm_resource_instance.at_instance.id
}

output "tracker_guid" {
  description = "The GUID of the activity tracker"
  value       = ibm_resource_instance.at_instance.guid
}
