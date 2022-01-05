# Module Support for Observability Service.

Observability services - gives you the visibility into the performance and health of your resources on IBM Cloud.  You can use these services to troubleshoot your apps and services, identify threats, detect performance issues, trigger alerts and more.  IBM Cloud offers the following observabilty services, to solve you logging and monitoring needs:

* _IBM Cloud Activity Tracker_ - to gain insights on actions that change the state of a service in the IBM Cloud.
* _IBM Log Analysis_ - to gain insights into your system and application logs.
* _IBM Cloud Monitoring_ - to monitor the health of services and applications in IBM Cloud.

This module is used to provision following observability instances

* Activity Tracker Super Tenant Receiver (ATR)
* Activity Tracker Super Tenant Sender (ATS)
* Logging Super Tenant Receiver (STR)
* Logging Super Tenant Sender (STS)
* Monitoring instance

##  Acronyms

| Acronym         | Full form                               |
|-----------------|-----------------------------------------|
| ATS             | Activity Tracker Super Tenant Sender    |
| ATR             | Activity Tracker Super Tenant Receiver  |
| STS             | Logging Super Tenant Sender             |
| STR             | Logging Super Tenant Receiver           |
| OB              | Observability


The following diagram illustrates the deployment architecture used by this automation.
![Observability design](diagrams/observability.png)                          |

## Provision activity tracker ATR instance

```
`atr_provision` = true
```

## Provision ATS activity tracker instance by creating logging STS insatnce
```
  is_provision_supertenant_activity_tracker  = true
  ats_service_supertenant    = <Name_of_ats_service_supertenant>
  supertenant_activity_tracker_provision_key          = <ats_provision_key>
  supertenant_activity_tracker_associated_logging_crn = <ats_associated_logging_crn>
```

## Provision ATS instance with existing logging STS instance CRN then configure

```
  is_provision_supertenant_activity_tracker              = true
  ats_service_supertenant    = <Name_of_ats_service_supertenant>
  supertenant_activity_tracker_provision_key          = <ats_provision_key>
  is_attach_existing_supertenant_logging_crn       = true
```

## Provision Logging STR instance

```
  str_provision = true
```
## Provision Logging STS instance
```
  is_provision_supertenant_logging           = true
  sts_service_supertenant = <sts_service_supertenant>
  supertenant_logging_provision_key       = <sts_provision_key>
```

## Monitoring

To provision monitoring instance

```
`is_provision_monitoring` = true
```

## Example Usage
```
#####################################################
# Observability
# Copyright 2020 IBM
#####################################################


```hcl
#####################################################
# Observability
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "rg" {
  name = var.resource_group
}

module "observability" {

  source = "../../"

  ################# Logging Super Tenant Receiver (STR) instance #######################

  is_provision_logging      = var.is_provision_logging
  is_bind_key_to_logging    = var.is_bind_key_to_logging
  enable_platform_logs      = var.enable_platform_logs
  logging_plan              = var.logging_plan
  logging_region            = var.logging_region
  logging_visbility         = var.logging_visbility
  logging_tags              = var.logging_tags
  logging_key_name          = var.logging_key_name
  logging_key_tags          = var.logging_key_tags

  ################## Logging Super Tenant Sender (STS) Instance ########################
  //STS
  is_provision_supertenant_logging    = var.is_provision_supertenant_logging
  sts_service_supertenant             = var.sts_service_supertenant
  supertenant_logging_provision_key   = var.supertenant_logging_provision_key

  //Logging
  is_bind_key_to_supertenant_logging    = var.is_bind_key_to_supertenant_logging
  supertenant_logging_plan              = var.supertenant_logging_plan
  supertenant_logging_region            = var.supertenant_logging_region
  supertenant_logging_visibility        = var.supertenant_logging_visibility
  supertenant_logging_tags              = var.supertenant_logging_tags
  supertenant_logging_key_name          = var.supertenant_logging_key_name
  supertenant_logging_key_tags          = var.supertenant_logging_key_tags

  ################# Activity Tracker ATR instance ##########

  is_provision_activity_tracker = var.is_provision_activity_tracker
  activity_tracker_plan         = var.activity_tracker_plan
  activity_tracker_region       = var.activity_tracker_region
  is_bind_key_to_activity_tracker  = var.is_bind_key_to_activity_tracker
  is_activity_tracker_the_default_receiver = var.is_activity_tracker_the_default_receiver
  activity_tracker_key_name     = var.activity_tracker_key_name
  activity_tracker_key_tags     = var.activity_tracker_key_tags
  activity_tracker_tags         = var.activity_tracker_tags

  ################# Activity Tracker ATS instance ##########

  //ATS
  is_provision_supertenant_activity_tracker              = var.is_provision_supertenant_activity_tracker
  supertenant_activity_tracker_name    = var.supertenant_activity_tracker_name
  supertenant_activity_tracker_provision_key          = var.supertenant_activity_tracker_provision_key
  is_attach_existing_supertenant_logging_crn = var.is_attach_existing_supertenant_logging_crn

  //Activity tracker
  supertenant_activity_tracker_plan     = var.supertenant_activity_tracker_plan
  supertenant_activity_tracker_region   = var.supertenant_activity_tracker_region
  is_bind_key_to_supertenant_activity_tracker = var.is_bind_key_to_supertenant_activity_tracker
  supertenant_activity_tracker_key_name = var.supertenant_activity_tracker_key_name
  supertenant_activity_tracker_key_tags = var.supertenant_activity_tracker_key_tags
  supertenant_activity_tracker_tags     = var.supertenant_activity_tracker_tags

  ################# Monitoring ############################
  is_provision_monitoring               = var.is_provision_monitoring
  is_bind_key_to_monitoring                = var.is_bind_key_to_monitoring
  monitoring_name                    = var.monitoring_name
  monitoring_plan                    = var.monitoring_plan
  monitoring_region                  = var.monitoring_region
  monitoring_visibility       = var.monitoring_visibility
  is_enable_platform_metrics     = var.is_enable_platform_metrics
  monitoring_tags                    = var.monitoring_tags
  monitoring_key_name                = var.monitoring_key_name
  monitoring_key_tags                = var.monitoring_key_tags


  ################ Generic Parameters ######################
  logging_name          = var.logging_name          // common for STS and STR
  activity_tracker_name = var.activity_tracker_name //common for ATS and ATR
  resource_group_id     = data.ibm_resource_group.rg.id
  create_timeout        = var.create_timeout
  update_timeout        = var.update_timeout
  delete_timeout        = var.delete_timeout
}





```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

##  Activity Tracker ATR Inputs

| Name                      | Description                                                      | Type         | Default | Required |
|---------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| is_provision_activity_tracker             | Set this to true to provion Activity tracker ATR instance        | bool         | true    | yes      |
| activity_tracker_name     | Name of the activity tracker instance                            | string       | true    | yes      |
| activity_tracker_plan                  | Plan type                                                        | string       | n/a     | yes      |
| activity_tracker_region                | Location to create the activity tracker instance.                | string       | n/a     | yes      |
| is_bind_key_to_activity_tracker              | Indicating that  key should be bind to activity tracker instance | bool         | false   | no       |
| activity_tracker_key_name              | Name used to identify activity tracker resource key              | string       | empty   | no       |
| activity_tracker_tags                  | Tags that should be applied to the activity tracker              | list(string) | n/a     | no       |
| activity_tracker_key_tags              | Tags that should be applied to the activity tracker key          | list(string) | n/a     | no       |
| is_activity_tracker_the_default_receiver | Enable this to make this instance as default receiver            | bool         | true    | no       |


##  Activity Tracker ATS Inputs

| Name                      | Description                                                      | Type         | Default | Required |
|---------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| is_provision_supertenant_activity_tracker             | Set this to true to provion Activity tracker ATS instance        | bool         | true   | no       |
| supertenant_activity_tracker_name   | Name of service supertenant                                      | string       | Empty   | no       |
| supertenant_activity_tracker_provision_key         | Service Provision key                                            | string       | Empty   | no       |
| is_attach_existing_supertenant_logging_crn      | Make true to use existing logging STS crn to attach to ATS instance| string       | Empty   | no       |
| supertenant_activity_tracker_associated_logging_crn| CRN of STS logging instance                                      | string       | Empty   | no       |
| supertenant_activity_tracker_name     | Used as prefix to observability instances                        | string       | n/a     | yes      |
| supertenant_activity_tracker_plan                  | Plan type                                                        | string       | n/a     | yes      |
| supertenant_activity_tracker_region                | Location to create the activity tracker instance.                | string       | n/a     | yes      |
| resource_group_id            | ID of the resource group                                       | string       | n/a     | yes      |
| is_bind_key_to_supertenant_activity_tracker              | Indicating that instance key should be bind to activity tracker  | bool         | false   | no       |
|supertenant_activity_tracker_key_name               | Name used to identify activity tracker resource key              | string       | empty   | no       |
| supertenant_activity_tracker_tags                  | Tags that should be applied to the activity tracker              | list(string) | n/a     | no       |
|supertenant_activity_tracker_key_tags               | Tags that should be applied to the activity tracker key          | list(string) | n/a     | no       |

##  Logging STR Inputs

| Name                      | Description                                                      | Type         | Default | Required |
|---------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| is_provision_logging             | Set this to true to provion logging STR instance                 | bool         | true    | no       |
| logging_name              | Name of the logging instance                                     | string       | n/a     | yes      |
| logging_plan          | The name of the plan type supported by logdna.                   | string       | n/a     | yes      |
| logging_region        | Location to create the logdna instance.                          | string       | n/a     | yes      |
| is_bind_key_to_logging      | Indicating that instance key should be bind to logdna            | bool         | false   | no       |
| logging_visbility| Type of service endpoint                                      | string       | n/a     | no       |
| logging_key_name      | Name used to identify logdna resource key                        | string       | empty   | no       |
| logging_tags          | Tags that should be applied to the logdna                        | list(string) | n/a     | no       |
| logging_key_tags      | Tags that should be applied to the logdna key                    | list(string) | n/a     | no       |
| enable_platform_logs      | Enable this to make this instace as default receiver             | bool         | true    | no       |

##  Logging STS Inputs

| Name                          | Description                                                      | Type         | Default | Required |
|-------------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| is_provision_supertenant_logging                 | Set this to true to provion logging STS instance                 | bool         | false   | no       |
| sts_service_supertenant       | Name of service supertenant                                      | string       | Empty   | no       |
| supertenant_logging_provision_key             | Service Provision key                                            | string       | Empty   | no       |
| logging_name                  | Name of the logging instance                                     | string       | n/a     | yes      |
| supertenant_logging_plan              | The name of the plan type supported by logdna.                   | string       | n/a     | yes      |
| supertenant_logging_region            | Location to create the logdna instance.                          | string       | n/a     | yes      |
| is_bind_key_to_supertenant_logging          | Indicating that instance key should be bind to logdna            | bool         | false   | no       |
| supertenant_logging_visibility | Type of service endpoint                                         | string       | n/a     | no       |
| supertenant_logging_key_name          | Name used to identify logdna resource key                        | string       | empty   | no       |
| sts_logging_role              | Name of the user role for logdna key.                            | string       | empty   | no       |
| supertenant_logging_tags              | Tags that should be applied to the logdna                        | list(string) | n/a     | no       |
| supertenant_logging_key_tags          | Tags that should be applied to the logdna key                    | list(string) | n/a     | no       |

##  Monitoring Inputs

| Name                      | Description                                                      | Type         | Default | Required |
|---------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| is_provision_monitoring      | Set this to true to provion monitoring instance                  | bool         | true    | no       |
| monitoring_name                      | Used as prefix to observability instances                        | string       | n/a     | yes      |
| monitoring_plan           | The name of the plan type supported by sysdig.                   | string       | n/a     | yes      |
| monitoring_region         | Location to create the sysdig instance.                          | string       | n/a     | yes      |
| is_bind_key_to_monitoring       | Indicating that instance key should be bind to sysdig            | bool         | false   | no       |
| monitoring_key_name       | Name used to identify sysdig resource key                        | string       | empty   | no       |
| monitoring_tags           | Tags that should be applied to the sysdig                        | list(string) | n/a     | no       |
| monitoring_key_tags       | Tags that should be applied to the sysdig key                    | list(string) | n/a     | no       |
| create_timeout            | Timeout duration for create                                      | string       | n/a     | no       |
| update_timeout            | Timeout duration for update                                      | string       | n/a     | no       |
| delete_timeout            | Timeout duration for delete                                      | string       | n/a     | no       |


## Usage

To create an infrastructure run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to remove an infrastructure run the following command

   `terraform destroy -var-file="input.tfvars"`

### Detect Secret hook

Used to detect secrets within a code base.

To create a secret baseline file run following command

```
detect-secrets scan --update .secrets.baseline
```

While running the pre-commit hook, if you encounter an error like

```
WARNING: You are running an outdated version of detect-secrets.
Your version: 0.13.1+ibm.27.dss
Latest version: 0.13.1+ibm.46.dss
See upgrade guide at https://ibm.biz/detect-secrets-how-to-upgrade
```

run below command

```
pre-commit autoupdate
```
which upgrades all the pre-commit hooks present in .pre-commit.yaml file.

## Timeout block

Same set of timeout values (create, update & delete) are applicable to all the observability resources present in root module. For example, say we configure create timeout as 90 mins then for sysdig, logdna and activity tracker create time out will be 90 mins for each.

We can set the create, update and delete timeouts as string. For e.g say we want to set 15 minutes timeout then the value should be "15m".
