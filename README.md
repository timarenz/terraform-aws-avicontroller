# tf_aws_avicontroller
A terraform module to deploy a single Avi Controller in AWS.

This module was tested with Avi Vantage version 17.1.9

## Input variables

### Required
* `environment_name` - Used as prefix for all supported object names
* `owner_name` - Also used as prefix for all supported object names
* `key_path` - Path to the public key used for SSH access to the Avi Controller.
* `ami_id` - AMI id of the Avi Controller version you want to deploy. See [AWS Marketplace: Avi Vantage Platform](https://aws.amazon.com/marketplace/pp/B01ICD3R7E)
* `password` - Password for the Avi Controller admin account.
* `subnet_id` - Id of the subnet the Avi Controller should be connected to

### Optional
* `instance_type` - AWS instance typ used to deploy the Avi Controller. For more information see [Installing Avi Vantage in Amazon Web Services](https://kb.avinetworks.com/docs/17.2/installing-avi-vantage-in-amazon-web-services/) (default, `m4.xlarge`)

## Output variables

* `public_ip` - Public IP address of the Avi Controller
* `public_dns` - Public FQDN of the Avi Controller
* `private_ip` - Private IP address of the Avi Controller

## Example
```hcl
module "avicontroller-aws" {
  source                = "github.com/timarenz/tf_aws_avicontroller"

  key_path              = "/Users/tim/.ssh/avicontroller.key"
  ami_id                = "ami-20de614f"
  subnet_id             = "subnet-19915954"
  password              = "123456"
  environment_name      = "staging"
  owner_name            = "tim"
}
```

## Authors
Created and maintaned by [Tim Arenz](https://github.com/timarenz)

## License
[MIT](LICENSE)