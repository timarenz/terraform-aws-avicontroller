variable "environment_name" {}

variable "public_key" {
  description = "Public key for Avi Controller authentication"
}

variable "instance_type" {
  default     = "m4.2xlarge"
  description = "Make sure the instance used here is supported by the Avi Controller. For more information see https://kb.avinetworks.com/docs/17.2/installing-avi-vantage-in-amazon-web-services/"
}

variable "password" {
  description = "The default admin password for the Avi Controller."
}

variable "subnet_id" {
  description = "Specify the id of the subnet the Avi controller should be connected to."
}
