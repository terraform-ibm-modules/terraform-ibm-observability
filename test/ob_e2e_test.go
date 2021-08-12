package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

// An example of how to test the Terraform module to create cos instance in examples/instance using Terratest.
func TestAccIBMObE2E(t *testing.T) {
	t.Parallel()

	// Construct the terraform options with default retryable errors to handle the most common retryable errors in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/ob-e2e",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"at_service_name":     "at2",
			"at_plan":             "7-day",
			"at_region":           "us-east",
			"resource_group":      "Default",
			"logdna_service_name": "l2",
			"logdna_plan":         "7-day",
			"logdna_region":       "us-south",
			"sysdig_service_name": "s2",
			"sysdig_plan":         "graduated-tier",
			"sysdig_region":       "us-south",
		},
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	/*instanceID := terraform.Output(t, terraformOptions, "cos_instance_id")
	if len(instanceID) <= 0 {
		t.Fatal("Wrong output")
	}
	fmt.Println("COS INstance iD", instanceID)*/
}
