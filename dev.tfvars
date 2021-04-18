environments            = "dev"
s3BuckerName            = "s3usw2appgredpsidevtfstate"
eksClusterName          = "eks-cluster-test"
clusterRoleName         = "EKSClusterRole"
clusterNodeRolename     = "EKSWorkerNodeRole"
endpointPrivateAccess   = false
endpointPublicAccess    = true
subnetIds = [
    "subnet-01c83fccd1a8250cc"
    "subnet-063aa9eecbffda074"
    "subnet-08a60871152cc2729"
]
tags = {
    environment = "Development"
    source      = "Terraform"
}
nodeGroupName           = "nodegrp1"
nodeDesiredSize         = 2
nodeMaxSize             = 3
nodeMinSize             = 1
vpcId                   = "vpc-0a78413f77b2590b8"
securityGroupName       = "ClusterSecurityGroup"
capacityType            = "SPOT"
autoScalingGroupName    = "eks-spot-instance-autoscaling"
amiId                   = "ami-03e7c8bcb768c2ada"
instanceType            = "t3.medium"
instanceKey             = "EKS-Test"
launchTemplateName      = "eks-spotinstance"
eksLogTypes             = ["api", "audit", "authenticator", "controllerManager", "scheduler"]