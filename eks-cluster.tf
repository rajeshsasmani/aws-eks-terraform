module "eks" {
  source             = "terraform-aws-modules/eks/aws"
  version            = "21.29.0"
  name               = var.cluster_name
  kubernetes_version = tostring(var.kubernetes_version)
  subnet_ids         = module.vpc.private_subnets

  enable_irsa = true

  tags = {
    cluster = "demo"
  }

  vpc_id = module.vpc.vpc_id

  eks_managed_node_groups = {
    node_group = {
      ami_type               = "AL2023_x86_64_STANDARD"
      instance_types         = ["t3.medium"]
      vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
      min_size               = 2
      max_size               = 3
      desired_size           = 2
    }
  }
}