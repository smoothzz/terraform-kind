# terraform-kind

A bootstrap to bring up a lab environment for playing and testing kubernetes.

What's needed?
    -> For now the only supported CRI is Docker
    -> Terraform installed
    -> Helm installed

How To:
    -> Git clone this repo ```git clone git@github.com:smoothzz/terraform-kind.git```
    -> Run terraform init
    -> The terraform apply

This will bring up a cluster with the following specs:
    -> Control Plane
    -> Work Node
    -> MetalLB
    -> Ingress Nginx with already configure to loadbalancer with the ip provided from metalLB.

Todo:
    -> Get the ip to configInline.address-pools[0].addresses[0] dynamic.
    -> More Helm applications with the option to enable and disable.
