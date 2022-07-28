terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    helm = {
      source = "hashicorp/helm"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
  required_version = ">= 1.1.2"

  backend "s3" {
    bucket         = "hdesettistatefiles"
    key            = "k8s/cluster/k8s-autoscaling-cluster/prometheusmonitoring/key/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamodb-state-locking-prometheusmonitoring"
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "arn:aws:eks:us-east-1:286824333895:cluster/k8s-autoscaling-cluster"
}
