package test

import (
	"testing"
	"time"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestCallTests(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../example/",
	})
	//after the test is done, run terraform destroy
	defer terraform.Destroy(t, terraformOptions)

	//init terraform
	terraform.InitAndApply(t, terraformOptions)

	//test Bucket
	testBucket(t, terraformOptions)

	//test Route53
	testRoute53(t, terraformOptions)

	//test Cloudfront
	testCloudfront(t, terraformOptions)
}

func testBucket(t *testing.T, terraformOptions *terraform.Options) {
	output := terraform.Output(t, terraformOptions, "bucket_site_domainname")
	assert.Equal(t, "test.diversifica.me.s3.amazonaws.com", output)
}

func testRoute53(t *testing.T, terraformOptions *terraform.Options) {
	output := terraform.Output(t, terraformOptions, "fqdn")
	assert.Equal(t, "test.diversifica.me", output)
}

func testCloudfront(t *testing.T, terraformOptions *terraform.Options) {
	url := "https://test.diversifica.me"
	http_helper.HttpGetWithRetry(t, url, nil, 200, "<html>\n<body>\n<p>Helloworld !</p>\n</body>\n</html>", 60, 3*time.Second)
}
