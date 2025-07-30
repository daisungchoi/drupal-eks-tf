module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"
  # provide VPC ID, subnets, cluster name, etc.
}
