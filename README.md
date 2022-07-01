# terraform-kind

A bootstrap to bring up a lab environment for playing and testing kubernetes.

What's needed?
- Terraform installed
- Helm installed
- Docker installed
- Kubectl

How To:
- Git clone this repo 
```
    git clone git@github.com:smoothzz/terraform-kind.git
```
- Run terraform init
- Then terraform apply
- After the terraform complete, just export the kubeconfig
```
    export KUBECONFIG=~/kind/config
```

This will bring up a cluster with the following specs:
- Control Plane
- Work Node
- MetalLB
- Ingress Nginx with already configure to loadbalancer with the ip provided from metalLB.

Todo:
- [x] Get the ip to configInline.address-pools[0].addresses[0] dynamic.
- [ ] More Helm applications with the option to enable and disable.