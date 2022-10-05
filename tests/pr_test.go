package test

import (
	"fmt"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testhelper"
)

const basicExampleTerraformDir = "examples/observability-complete"
const resourceGroup = "geretain-test-observability-instances"

/*
*********************************************
NOTE: this private function "setupOptions" is not required.
It helps if you have several tests that will all use a very similar
set of options.
If you have a test that uses a different set of options you can set those
up in the individual test.
***********************************************
*/
func setupOptions(t *testing.T, prefix string, region1 string, region2 string) *testhelper.TestOptions {

	options := testhelper.TestOptionsDefault(&testhelper.TestOptions{
		Testing:       t,
		TerraformDir:  basicExampleTerraformDir,
		Prefix:        prefix,
		ResourceGroup: resourceGroup,
		Region:        region1,
	})

	options.TerraformVars = map[string]interface{}{
		"logging_name":          fmt.Sprintf("%s-%s", options.Prefix, "logging"),
		"activity_tracker_name": fmt.Sprintf("%s-%s", options.Prefix, "at"),
		"monitoring_name":       fmt.Sprintf("%s-%s", options.Prefix, "sysdig"),
		"resource_group":        options.ResourceGroup,
		"str_logging_region":    options.Region,
		"sts_logging_region":    region2,
		"atr_region":            options.Region,
		"ats_region":            region2,
		"monitoring_region":     options.Region,
	}

	return options
}

/*
******************************************************
This will run the basic example using two different regions for AT
(one for std and one for sts).
The test will apply the example, then an immediate plan and check
if there are no further changes to apply (idempotent check).
*******************************************************
*/
func TestRunBasicExample(t *testing.T) {
	t.Parallel()

	options := setupOptions(t, "ibm-obs-all", "au-syd", "eu-de")

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

/*
******************************************************
This will run an UPGRADE test on the basic example using two
different regions for AT (one for std and one for sts) and
also different than the standard test to avoid region conflicts.

The upgrade test will check out the "main" branch, run apply,
then check out the PR branch and run a plan. If there are any
changes that would result in destruction of resources it will fail,
warning the developers that the PR may contain a breaking change.

NOTE: This upgrade test will be skipped if the go test is run with
the "-short" option, or if any commit messages in the PR branch contain
the "BREAKING CHANGE" text.
*******************************************************
*/
func TestRunUpgradeExample(t *testing.T) {
	t.Parallel()

	options := setupOptions(t, "ibm-obs-upg", "us-east", "ca-tor")

	output, err := options.RunTestUpgrade()
	if !options.UpgradeTestSkipped {
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}
}
