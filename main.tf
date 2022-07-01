resource "random_id" "instance_id" {
  byte_length = 3
}

locals {
  k8s_config_path = pathexpand("~/kind/config")
}

resource "kind_cluster" "default" {
  name            = "cluster-${random_id.instance_id.hex}"
  wait_for_ready  = true
  node_image      = "kindest/node:v1.21.10"
  kubeconfig_path = local.k8s_config_path

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"nodeapp=loadbalancer\"\n"
      ]

      extra_port_mappings {
        container_port = 80
        host_port      = 80
      }
      extra_port_mappings {
        container_port = 443
        host_port      = 443
      }
    }

    node {
      role = "worker"
    }
  }
}