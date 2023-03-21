terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

data "aws_eks_cluster" "josh" {
  name = "josh"
}
data "aws_eks_cluster_auth" "josh_auth" {
  name = "josh_auth"
}
provider "kubernetes" {
  host                   = data.aws_eks_cluster.josh.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.josh.certificate_authority[0].data)
  version          = "2.16.1"
  config_path = "~/.kube/config"
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", "josh"]
    command     = "aws"
  }
}
