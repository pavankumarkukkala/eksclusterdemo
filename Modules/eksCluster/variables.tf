variable "eksLogTypes" {
  type            = list(any)
  description     = "Enter log types for EKS cluster"
}

variable "eksClusterName" {
  type            = string
  description     = " Enter cluster name"
}

variable "clusterRoleArn" {
  type            = string
  description     = "Enter EKS cluster EKS role Arn"
}

variable "tags" {
  type            = map(string)
  description     = "enter the tags for resources"
}

variable "endpointPrivateAccess" {
  type            = string
  description     = "Enter endpoint private acess to be enabled or not"
}

variable "endpointPublicAccess" {
  type            = string
  description     = "Enter endpoint public acess to be enabled or not"
}

variable "subnetIds" {
  type            = list(any)
  description     = "Enter subnet ids"
}

variable "securityGroupId" {
  type            = string
  description     = "Enter security group Id"
}