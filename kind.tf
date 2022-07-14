resource "random_id" "instance_id" {
  byte_length = 3
}

resource "random_integer" "iprange" {
  min = 50
  max = 150
}
data "docker_network" "main" {
  name = "kind"
}

locals {
  k8s_config_path = pathexpand("~/kind/config")
}

resource "kind_cluster" "default" {
  name            = "cluster-${random_id.instance_id.hex}"
  wait_for_ready  = true
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