data "aws_iam_role" "serviceLinkedRole" {
  name = "AWSServiceRoleForAutoScaling"
}

resource "aws_eks_node_group" "nodegrp1" {
  cluster_name      = var.cluster_name
  node_group_name   = var.nodeGroupName
  node_role_arn     = var.node_role_arn
  subnet_ids        = var.subnetIds
  lifecycle {
    ignore_changes = [
        scaling_config.0.desired_size,
    ]
  }
  scaling_config {
    desired_size    = var.nodeDesiredSize
    max_size        = var.nodeMaxSize
    min_size        = var.nodeMinSize
  }
  capacity_type = var.capacityType
  launch_template {
    id = aws_launch_template.nodeLaunchTemplate.id
    version = 1
  }
}

#aws_launch_template.nodeLaunchTemplate:
resource "aws_launch_template" "nodeLaunchTemplate" {
  default_version           = 1
  disable_api_termination   = false
  image_id                  = var.amiId
  instance_type             = var.instanceType
  key_name                  = var.instanceKey
  name                      = var.launchTemplateName
  tags                      = var.tags
  user_data                 = var.certificate_authority
  vpc_security_group_ids    = []

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      iops = 0
      volume_size = 20
      volume_type = "gp2"
    }
  }

  metadata_options {
    http_put_response_hop_limit = 2
    http_endpoint = "enabled"
  }

  network_interfaces {
    device_index = 0
    ipv4_address_count = 0
    ipv4_addresses = []
    ipv6_address_count = 0
    ipv6_addresses = []
    security_groups = []
  }
}

#aws_autoscaling_group.web:
resource "aws_autoscaling_group" "eksAutoScaling" {
    availability_zones = [ 
        "us-west-2a",
        "us-west-2b",
        "us-west-2c",
     ]
     default_cooldown = 300
     desired_capacity = 2
     enabled_metrics = []
     health_check_grace_period = 15
     health_check_type = "EC2"
     load_balancers = []
     max_instance_lifetime = 0
     max_size = 2
     metrics_granularity = "1Minute"
     min_size = 2
     name = var.autoScalingGroupName
     project_from_scale_in = false
     service_linked_role_arn = data.aws_iam_role.serviceLinkedRole.name
     suspended_processes = []
     target_group_arns = []
     termination_policies = [
         "AllocationStrategy",
         "OldestLaunchTemplate",
         "OldestInstance",
     ]

     mixed_instances_policy {
       instances_distribution {
           on_demand_allocation_strategy = "prioritized"
           on_demand_base_capacity = 0
           on_demand_percentage_above_base_capacity = 0
           spot_allocation_strategy = "capacity-optimized"
           spot_instance_pools = 0
       }

       launch_template {
         launch_template_specification {
             launch_template_id = aws_launch_template.nodeLaunchTemplate.id
             launch_template_name = aws_launch_template.nodeLaunchTemplate.name
             version = "1"
         }

         override {
           instance_type = "t3.medium"
         }
       }
     }
     tag {
       key = "eks:cluster-name"
       propagate_at_launch = true
       value = "eks-infra-cluster"
     }
     tag {
       key = "eks:nodegroup-name"
       propagate_at_launch = true
       value = "worker-nodes"
     }
     tag {
       key = "k8s.io/cluster-autoscaler/eks-infra-cluster"
       propagate_at_launch = true
       value = "owned"
     }
     tag {
       key = "k8s.io/cluster-autoscaler/enabled"
       propagate_at_launch = true
       value = "true"
     }
     tag {
       key = "kubernetes.io/cluster/eks-infra-cluster"
       propagate_at_launch = true
       value = "owned"
     }

     timeouts {}
}