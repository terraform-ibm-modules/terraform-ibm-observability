package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

// An example of how to test the Terraform module to create cos instance in examples/instance using Terratest.
func TestAccIBMLogdna(t *testing.T) {
	t.Parallel()

	// Construct the terraform options with default retryable errors to handle the most common retryable errors in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/logging-logdna-instance",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"service_name":      "loggingLogdna",
			"plan":              "7-day",
			"region":            "us-south",
			"resource_group":    "default",
			"tags":              []string{"T1", "T2"},
			"bind_resource_key": false,
			"resource_key_name": "key",
			"resource_key_tags": []string{"T3", "T4"},
			"role":              "Manager",
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
