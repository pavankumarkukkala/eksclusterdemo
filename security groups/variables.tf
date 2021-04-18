variable "securityGroupName" {
  type = string
  description = "enter Security Group Name"
}

variable "vpcId" {
  type = string
  description = "Enter VPC Id"
}

variable "tags" {
  type = map(string)
  description = "Enter tags for the resources"
}