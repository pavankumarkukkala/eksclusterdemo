variable "s3BucketName" {
    type          = string
    description   = "Enter s3 bucketname for backend configuration"
}

variable "environments" {
    type          = string
    description   = "enter environment on which eks will deploy"
}

variable "eksClusterName" {
  type            = string
  description     = " Enter cluster name"
}

variable "clusterRoleName" {
  type            = string
  description     = "Enter cluster role name"
}

variable "clusterNodeRoleName" {
  type            = string
  description     = "Enter cluster Node role name"
}

variable "endpointPrivateAccess" {
  type            = string
  description     = "Enter endpoint private acess to be enabled or not"
}

variable "endpointPublicAccess" {
  type            = string
  description     = "Enter endpoint public acess to be enabled or not"
}

variable "vpcId" {
  type            = string
  description     = "Enter vpc id"
}

variable "subnetIds" {
  type            = list(any)
  description     = "Enter subnet ids"
}

variable "securityGroupName" {
  type            = string
  description     = "Enter security group name"
}

variable "capacityType" {
  type            = string
  description     = "Enter spot or on-demand"
}

variable "tags" {
  type            = map(string)
  description     = "enter the tags for resources"
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

variable "autoScalingGroupName" {
  type            = string
  description     ="Enter AutoScalingGroup name"
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

variable "eksLogTypes" {
  type            = list(any)
  description     = "Enter log types for EKS cluster"
}