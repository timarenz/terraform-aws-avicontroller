variable "environment_name" {
  default     = "avicontroller"
  description = "Name tag for the server."
}

variable "owner_name" {
  description = "Tag to identify machine owner."
}

variable "key_path" {
  description = "Path to the public key."
}

variable "instance_type" {
  default     = "m4.xlarge"
  description = "Make sure the instance used here is supported by the Avi Controller. For more information see https://kb.avinetworks.com/docs/17.2/installing-avi-vantage-in-amazon-web-services/"
}

variable "ami_id" {
  description = "AMI id of the Controller version you want to deploy, make sure it is on the correct region."
}

variable "password" {
  description = "The default admin password for the Avi Controller."
}

variable "subnet_id" {
  description = "Specify the id of the subnet the Avi controller should be connected to."
}