package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testhelper"
)

const basicExampleTerraformDir = "examples/observability-complete"
const resourceGroup = "geretain-test-observability-instances"

func setupOptions(t *testing.T, prefix string, region string) *testhelper.TestOptions {

	/********************************
	This section is here until we figure out what options we want to give to
	set an api key.
	Right now the examples are meant to set IC_API_KEY, but Goldeneye
	automation is meant to use an input variable TF_VAR_ibmcloud_api_key.
	This section will take care of fixing one or the other, depending which
	is set for the test.
	********************************/
	tf_key, tf_present := os.LookupEnv("TF_VAR_ibmcloud_api_key")
	ic_key, ic_present := os.LookupEnv("IC_API_KEY")
	// set terraform env var so that testhelper validates correctly
	if !tf_present && ic_present {
		t.Log("IC_API_KEY provided and used for TF_VAR_ibmcloud_api_key")
		os.Setenv("TF_VAR_ibmcloud_api_key", ic_key)
	}
	// test relies on ic_api_key being set, so if terraform variable passed, use that
	if !ic_present && tf_present {
		t.Log("TF_VAR_ibmcloud_api_key provided and used for IC_API_KEY")
		os.Setenv("IC_API_KEY", tf_key)
	}

	options := testhelper.TestOptionsDefault(&testhelper.TestOptions{
		Testing:       t,
		TerraformDir:  basicExampleTerraformDir,
		Prefix:        prefix,
		ResourceGroup: resourceGroup,
		Region:        region,
	})

	options.TerraformVars = map[string]interface{}{
		"logging_name":          fmt.Sprintf("%s-%s", options.Prefix, "logging"),
		"activity_tracker_name": fmt.Sprintf("%s-%s", options.Prefix, "at"),
		"monitoring_name":       fmt.Sprintf("%s-%s", options.Prefix, "sysdig"),
		"resource_group":        options.ResourceGroup,
		"str_logging_region":    options.Region,
		"sts_logging_region":    options.Region,
		"atr_region":            options.Region,
		"ats_region":            options.Region,
		"monitoring_region":     options.Region,
	}

	return options
}

func TestRunBasicExample(t *testing.T) {
	t.Parallel()

	options := setupOptions(t, "ibm-obs-all", "us-south")

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}
