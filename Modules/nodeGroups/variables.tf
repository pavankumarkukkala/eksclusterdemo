variable "subnetIds" {
  type            = list(any)
  description     = "Enter subnet ids"
}

variable "nodeGroupName" {
  type            = string
  description     = "Enter node group name"
}

variable "nodeDesiredSize" {
  description     = "Enter node desired size"
}

variable "nodeMaxSize" {
  description     = "Enter max nodes"
}

variable "nodeMinSize" {
  description     = "Enter Min Nodes"
}

variable "eksClusterName" {
  type            = string
  description     = " Enter cluster name"
}

variable "clusterRoleArn" {
  type            = string
  description     = "Enter EKS cluster EKS role Arn"
}

variable "capacityType" {
  type            = string
  description     = "Enter spot or on-demand"
}

variable "certificate_authority" {
  description = "EnterCertificate authority of EKS cluster"
}

variable "autoScalingGroupName" {
  type = string
  description = "Enter Autoscaling Group name"
}

variable "amiId" {
  type            = string
  description     = "Enter AMI ID to launch spot instances."
}

variable "instanceType" {
  type            = string
  description     = "Enter isntance size"
}

variable "instanceKey" {
  type            = string
  description     = "Enter Instance Key"
}

variable "LaunchTemplateName" {
  type            = string
  description     = "Enter Launch Template"
}