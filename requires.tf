terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.0.12"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.6.0"
    }
    docker = {
      source = "kreuzwerker/docker"
      version = "2.18.1"
    }
  }
}