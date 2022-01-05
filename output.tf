
######################################################
# activity tracker
######################################################

output "activity_tracker_id" {
  description = "ID of activity tracker instance"
  value       = concat(module.activity-tracker-atr-instance.*.id, [""])[0]
}

output "supertenant_activity_tracker_id" {
  description = "ID of super-tenant activity tracker instance"
  value       = concat(module.activity-tracker-ats-instance.*.id, [""])[0]
}

output "activity_tracker_guid" {
  description = "The GUID of the activity tracker"
  value       = concat(module.activity-tracker-atr-instance.*.guid, [""])[0]
}

output "supertenant_activity_tracker_guid" {
  description = "The GUID of the activity tracker"
  value       = concat(module.activity-tracker-ats-instance.*.guid, [""])[0]
}


output "activity_tracker_key_id" {
  description = "Activity tracker key id"
  value       = concat(module.activity-tracker-atr-instance.*.key_id, [""])[0]
}

output "supertenant_activity_tracker_key_id" {
  description = "Activity tracker key id"
  value       = concat(module.activity-tracker-ats-instance.*.key_id, [""])[0]
}

output "activity_tracker_key_guid" {
  description = "Activity tracker key guid"
  value       = concat(module.activity-tracker-atr-instance.*.key_guid, [""])[0]
}

output "supertenant_activity_tracker_key_guid" {
  description = "Activity tracker key guid"
  value       = concat(module.activity-tracker-ats-instance.*.key_guid, [""])[0]
}

output "activity_tracker_key_credentials" {
  description = "Activity tracker key credentials"
  value       = concat(module.activity-tracker-atr-instance.*.key_credentials, [""])[0]
}

output "supertenant_activity_tracker_key_credentials" {
  description = "Activity tracker key credentials"
  value       = concat(module.activity-tracker-ats-instance.*.key_credentials, [""])[0]
}


######################################################
# Logging output parameters
######################################################

output "logging_id" {
  description = "ID of logging instance"
  value       = concat(module.logging_str_instance.*.id, [""])[0]
}

output "supertenant_logging_id" {
  description = "ID of super-tenant logging instance"
  value       = concat(module.logging_sts_instance.*.id, [""])[0]
}

output "logging_guid" {
  description = "GUID of the logging instance"
  value       = concat(module.logging_str_instance.*.guid, [""])[0]
}

output "supertenant_logging_guid" {
  description = "GUID of super-tenant logging instance"
  value       = concat(module.logging_sts_instance.*.guid, [""])[0]
}

output "logging_key_id" {
  description = "ID of logging instance key"
  value       = concat(module.logging_str_instance.*.key_id, [""])[0]
}

output "supertenant_logging_key_id" {
  description = "ID of super-tenant logging instance key"
  value       = concat(module.logging_sts_instance.*.key_id, [""])[0]
}

output "logging_key_guid" {
  description = "GUID of logging instance key"
  value       = concat(module.logging_str_instance.*.key_guid, [""])[0]
}

output "supertenant_logging_key_guid" {
  description = "GUID of super-tenant logging instance key"
  value       = concat(module.logging_sts_instance.*.key_guid, [""])[0]
}

output "logging_key_credentials" {
  description = "The credentials associated with the STR instance key"
  value       = concat(module.logging_str_instance.*.key_credentials, [""])[0]
}

output "supertenant_logging_key_credentials" {
  description = "The credentials associated with the STS instance key"
  value       = concat(module.logging_sts_instance.*.key_credentials, [""])[0]
}

######################################################
#  monitoring
######################################################

output "monitoring_id" {
  description = "ID of monitoring instance"
  value       = concat(module.monitoring_instance.*.id, [""])[0]
}

output "monitoring_guid" {
  description = "The GUID of the monitoring"
  value       = concat(module.monitoring_instance.*.guid, [""])[0]
}

output "monitoring_key_id" {
  description = "ID of monitoring instance key"
  value       = concat(module.monitoring_instance.*.key_id, [""])[0]
}

output "monitoring_key_guid" {
  description = "GUID of monitoring instance key"
  value       = concat(module.monitoring_instance.*.key_guid, [""])[0]
}

output "monitoring_key_credentials" {
  description = "Monitoring instance key credentials"
  value       = concat(module.monitoring_instance.*.key_credentials, [""])[0]
}
