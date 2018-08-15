# terraform-aws-avicontroller
A terraform module to deploy an Avi Controller cluster using the latest version available in AWS.

## External requirements
To run this module the control machine needs to have `curl` and `jq` installed.

## Terraform version
This module was created and tested with Terraform version 0.11.7.

## Inputs

| Name | Decription | Type | Default | Required |
| ---- | ---------- | ---- | ------- | -------- |
| environment_name | Used as prefix for all supported object names | string | - | yes |
| public_key | public key used for SSH access to the Avi Controller | string | - | yes |
| password | Password for the Avi Controller admin account | string | - | yes |
| subnet_id | AWS subnet id of the subnet the Avi Controller should be connected to | string | - | yes |
| cluster | Specifies if a cluster will be required. If so three Avi Controllers will be created | string | `false` | no | 
| instance_type | AWS instance typ used to deploy the Avi Controller. For more information see [Installing Avi Vantage in Amazon Web Services](https://kb.avinetworks.com/docs/17.2/installing-avi-vantage-in-amazon-web-services/) | string | `m4.2xlarge` | no | 
| ami_id | By default latest Avi Controller id will be used. Specify ami_id to use a certain version | string | - | no |

## Outputs

| Name | Decription |
| ---- | ---------- |
| public_ip | Public IP address of the Avi Controller |
| public_dns | Public FQDN of the Avi Controller |
| private_ip | Private IP address of the Avi Controller |

## Example
```hcl
module "avicontroller-aws" {
  source                = "github.com/timarenz/tf_aws_avicontroller"

  public_key            = "${file("avicontroller.key.pub")}"
  subnet_id             = "subnet-19915954"
  password              = "123456"
  environment_name      = "tim-staging"
}
```

## Authors
Created and maintaned by [Tim Arenz](https://github.com/timarenz)

## License
[MIT](LICENSE)
