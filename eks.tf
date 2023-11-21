module "eks-cluster" {
  source           = "terraform-aws-modules/eks/aws"
  version          = "17.1.0"
  cluster_name     = "${var.cluster_name}"
  cluster_version  = "1.20"
  write_kubeconfig = true #Whether to write a Kubectl config file containing the cluster configuration. Saved to `kubeconfig_output_path`.

  subnets = module.vpc.private_subnets
  vpc_id  = module.vpc.vpc_id

  #A list of maps defining worker group configurations to be defined using AWS Launch Templates
  worker_groups_launch_template = local.worker_groups_launch_template

  # map developer & admin ARNs as kubernetes Users Additional IAM users to add to the aws-auth configmap.
  map_users = concat(local.admin_user_map_users, local.developer_user_map_users)
}


