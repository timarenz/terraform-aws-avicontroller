# tf_aws_perf_server_client
A terraform module to deploy a single Avi Controller using the latest version available in AWS.

## Input variables

### Required
* `environment_name` - Used as prefix for all supported object names
* `public_key` - public key used for SSH access to the Avi Controller.
* `password` - Password for the Avi Controller admin account.
* `subnet_id` - AWS subnet id of the subnet the Avi Controller should be connected to

### Optional
* `instance_type` - AWS instance typ used to deploy the Avi Controller. For more information see [Installing Avi Vantage in Amazon Web Services](https://kb.avinetworks.com/docs/17.2/installing-avi-vantage-in-amazon-web-services/) (default, `m4.2xlarge`)

## Output variables

* `public_ip` - Public IP address of the Avi Controller
* `public_dns` - Public FQDN of the Avi Controller
* `private_ip` - Private IP address of the Avi Controller

## Example
```hcl
module "avicontroller-aws" {
  source                = "github.com/timarenz/tf_aws_avicontroller"

  key_path              = "/Users/tim/.ssh/avicontroller.key"
  subnet_id             = "subnet-19915954"
  password              = "123456"
  environment_name      = "tim-staging"
}
```

## Authors
Created and maintaned by [Tim Arenz](https://github.com/timarenz)

## License
[MIT](LICENSE)