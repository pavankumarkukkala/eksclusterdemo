resource "aws_eks_cluster" "devCluster" {
  enabled_cluster_log_types =  var.eksLogTypes
  name                      =  var.eksClusterName
  role_arn                  = var.eksRoleArn
  tags                      = var.tags
  version                   = "1.18"

  timeouts {}

  vpc_config {
    endpoint_private_access     = var.endpointPrivateAccess
    endpoint_public_access      = var.endpointPublicAccess
    public_access_cidrs = [
        "0.0.0.0/0",
    ]
    security_group_ids  = var.security_group_ids
    subnet_ids          = var.subnetIds
  }
}