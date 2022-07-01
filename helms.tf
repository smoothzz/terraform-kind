resource "helm_release" "metallb" {
  depends_on = [
    kind_cluster.default
  ]

  name = "metallb"

  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  create_namespace = true
  namespace        = "metallb-system"
  wait             = true

  set {
    name  = "configInline.address-pools[0].addresses[0]"
    value = "172.18.0.100/32"
  }
  set {
    name  = "configInline.address-pools[0].name"
    value = "default"
  }
  set {
    name  = "configInline.address-pools[0].protocol"
    value = "layer2"
  }
  set {
    name  = "controller.nodeSelector.nodeapp"
    value = "loadbalancer"
  }
  set {
    name  = "controller.tolerations[0].key"
    value = "node-role.kubernetes.io/master"
  }
  set {
    name  = "controller.tolerations[0].effect"
    value = "NoSchedule"
  }
  set {
    name  = "speaker.tolerateMaster"
    value = "true"
  }
  set {
    name  = "speaker.nodeSelector.nodeapp"
    value = "loadbalancer"
  }
}

resource "helm_release" "ingress-nginx" {
  depends_on = [
    kind_cluster.default,
    helm_release.metallb
  ]

  name = "ingress-nginx"

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  create_namespace = true
  namespace        = "ingress-nginx"
  wait             = true

  set {
    name  = "annotations.kubernetes.io/is-default-class"
    value = "true"
  }
  set {
    name  = "controller.nodeSelector.nodeapp"
    value = "loadbalancer"
  }
  set {
    name  = "controller.tolerations[0].key"
    value = "node-role.kubernetes.io/master"
  }
  set {
    name  = "controller.tolerations[0].effect"
    value = "NoSchedule"
  }
  set {
    name  = "podLabels.nodeapp"
    value = "loadbalancer"
  }
  set {
    name  = "service.annotations.metallb.universe.tf/address-pool"
    value = "default"
  }
  set {
    name  = "defaultBackend.enabled"
    value = "true"
  }
}