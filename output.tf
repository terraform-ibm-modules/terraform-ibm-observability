
######################################################
# activity tracker
######################################################

output "at_id" {
  description = "Activity tracker id"
  value       = concat(ibm_resource_instance.at_instance.*.id, [""])[0]
}

output "at_guid" {
  description = "The GUID of the activity tracker"
  value       = concat(ibm_resource_instance.at_instance.*.guid, [""])[0]
}

output "at_key_id" {
  description = "Activity tracker key id"
  value       = concat(ibm_resource_key.activity_tracker_key.*.id, [""])[0]
}

output "at_key_guid" {
  description = "Activity tracker key guid"
  value       = concat(ibm_resource_key.activity_tracker_key.*.guid, [""])[0]
}

output "at_key_credentials" {
  description = "Activity tracker key credentials"
  value       = concat(ibm_resource_key.activity_tracker_key.*.credentials, [""])[0]
}


######################################################
# Logdna
######################################################

output "logdna_id" {
  description = "logdna id"
  value       = concat(ibm_resource_instance.logdna_instance.*.id, [""])[0]
}

output "logdna_guid" {
  description = "The GUID of the logdna"
  value       = concat(ibm_resource_instance.logdna_instance.*.guid, [""])[0]
}

output "logdna_key_id" {
  description = "logdna key id"
  value       = concat(ibm_resource_key.logdnaKey.*.id, [""])[0]
}

output "logdna_key_guid" {
  description = "logdna key guid"
  value       = concat(ibm_resource_key.logdnaKey.*.guid, [""])[0]
}

output "logdna_key_credentials" {
  description = "logdna key credentials"
  value       = concat(ibm_resource_key.logdnaKey.*.credentials, [""])[0]
}

######################################################
# sysdig monitoring
######################################################

output "sysdig_id" {
  description = "sysdig id"
  value       = concat(ibm_resource_instance.sysdig_instance.*.id, [""])[0]
}

output "sysdig_guid" {
  description = "The GUID of the sysdig"
  value       = concat(ibm_resource_instance.sysdig_instance.*.guid, [""])[0]
}

output "sysdig_key_id" {
  description = "sysdig key id"
  value       = concat(ibm_resource_key.sysdigKey.*.id, [""])[0]
}

output "sysdig_key_guid" {
  description = "sysdig key guid"
  value       = concat(ibm_resource_key.sysdigKey.*.guid, [""])[0]
}

output "sysdig_key_credentials" {
  description = "sysdig key credentials"
  value       = concat(ibm_resource_key.sysdigKey.*.credentials, [""])[0]
}
