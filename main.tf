data "aws_iam_role" "eksRole" {
    name = var.clusterRoleName
}
data "aws_iam_role" "eksNodeRole" {
    name = var.clusterNodeRoleName
}

module "securityGroup" {
    source                  = "./modules/securityGroups"
    securityGroupName       = var.securityGroupName
    vpcId                   = var.vpcId
    tags                    = var.tags
}

module "eksCluster" {
    source                  = "./modules/eksCluster"
    eksLogTypes             = var.eksLogTypes
    eksClusterName          = var.eksClusterName
    eksRoleArn              = data.aws_iam_role.eksRole.Arn
    endpointPrivateAccess   = var.endpointPrivateAccess
    endpoint_public_access  = var.endpointPublicAccess
    security_group_ids      = [module.securityGroup.securityGroupId]
    subnet_ids              = var.subnetIds
}

module "nodeGroup1" {
    source                  = "./modules/nodeGroups"
    cluster_name            = aws_eks_cluster.devCluster.name
    nodeGroupName           = var.nodeGroupName
    node_role_arn           = data.aws_iam_role.eksNodeRole.arn
    subnetIds               = var.subnetIds
    nodeDesiredSize         = var.nodeDesiredSize
    nodeMaxSize             = var.nodeMaxSize
    nodeMinSize             = var.nodeMinSize
    capacityType            = var.capacityType
    certificate_authority   = module.eksCluster.eksCertificateAuthority
    autoScalingGroupName    = var.autoScalingGroupName
    amiId                   = var.amiId
    instanceType            = var.instanceType
    instanceKey             = var.instanceKey
    LaunchTemplateName      = var.LaunchTemplateName
    }