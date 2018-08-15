variable "environment_name" {
  type = "string"
  description = "Add an environment name to uniquily identify all resources created by this module"
}

variable "public_key" {
  type = "string"
  description = "Public key for Avi Controller authentication"
}

variable "instance_type" {
  type = "string"
  default     = "m4.2xlarge"
  description = "Make sure the instance used here is supported by the Avi Controller. For more information see https://kb.avinetworks.com/docs/17.2/installing-avi-vantage-in-amazon-web-services/"
}

variable "password" {
  type = "string"
  description = "The default admin password for the Avi Controller."
}

variable "subnet_id" {
  type = "string"
  description = "Specify the id of the subnet the Avi controller should be connected to."
}

variable "ami_id" {
  type = "string"
  default = ""
  description = "By default the latest Avi Controller in AWS will be used. If a specific version is required the AMI id can be specified here."
}

variable "cluster" {
  type = "string"
  default = false
  description = "Set to true if three Avi controller instances should be created to later on create an Avi Controller Cluster"
}