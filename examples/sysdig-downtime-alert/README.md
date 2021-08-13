# Module monitoring-sysdig

This example demonstarte how to create a sydig provider downtime alert

## Example Usage
```
provider "sysdig" {
  sysdig_monitor_api_token = data.external.monitor_api_key.result["api_key"]
  sysdig_monitor_url       = data.ibm_resource_key.resource_key.credentials["Sysdig Endpoint"]
}

resource "sysdig_monitor_alert_downtime" "sample" {
  name        = var.alert_name
  description = var.description
  severity    = var.severity

  entities_to_monitor = var.monitor_list

  trigger_after_minutes = var.trigger_time
  trigger_after_pct     = var.pct
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs


| Name                | Description                                                      | Type         | Default | Required |
|---------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| resource_group_name | Name of the resource group                                       | string       | n/a     | yes      |
| instance_name       | Resource instance name                                           | string       | n/a     | yes      |
| location            | Location or the environment in which instance exists             | string       | n/a     | no       |
| service_key_name    | Name of the key.                                                 | string       | n/a     | yes      |
| alert_name          | Name of the alert.                                               | string       | n/a     | yes      |
| description         | Description of Monitor alert.                                    | string       | n/a     | no       |
| severity            | Severity of the Monitor alert.                                   | number       | 4       | no       |
| monitor_list        | List of metrics to monitor downtime and alert on.                | list(string) | n/a     | yes      |
| trigger_time        | Threshold of time for status to stabilize until alert is fired.  | number       | n/a     | yes      |
| pct                 | Below of this percentage of downtime the alert will be triggered.| number       | 100     | no       |

## Note

All optional fields are given value `null` in varaible.tf file. User can configure the same by overwriting with appropriate values.

## Usage

To create an infrastructure run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to remove an infrastructure run the following command

   `terraform destroy -var-file="input.tfvars"`