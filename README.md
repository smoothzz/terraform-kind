# terraform-kind

A bootstrap to bring up a lab environment for playing and testing kubernetes.

What's needed?
- Terraform installed
- Helm installed
- Docker installed
- Kubectl

How To use:
- Just instance the module in a terraform file.
```
    module "terrafom-kind" {
        source = "github.com/smoothzz/terraform-kind"
    }
```
- Run terraform init
- You can pass variables to enable or disable extra helms, just set it to false or true.
```
    cert-manager = false
    keda         = false
    monitoring   = false
```
- Then terraform apply
- After the terraform complete, just export the kubeconfig
```
    export KUBECONFIG=~/kind/config
```

This will bring up a cluster with the following specs:
- Control Plane
- Work Node
- MetalLB
- Ingress Nginx with already configured loadbalancer with the ip provided from metalLB.

Todo:
- [x] Get the ip to configInline.address-pools[0].addresses[0] dynamic.
- [x] More Helm applications with the option to enable and disable.
    - [x] cert-manager
    - [x] keda
    - [x] prometheus-stack (monitoring tool)
    - If ya have any app to include just open a pr or suggest it in the issues.