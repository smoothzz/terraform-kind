provider "random" {}

provider "kind" {}

provider "helm" {
  kubernetes {
    config_path = "~/kind/config"
  }
}
provider "docker" {}