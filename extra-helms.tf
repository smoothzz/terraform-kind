resource "helm_release" "cert-manager" {
  count = var.cert-manager ? 1 : 0

  depends_on = [
    kind_cluster.default
  ]

  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  create_namespace = true
  namespace        = "cert-manager"
  version          = "v1.8.2"

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "helm_release" "keda" {
  count = var.keda ? 1 : 0

  depends_on = [
    kind_cluster.default
  ]

  name             = "kedacore"
  repository       = "https://kedacore.github.io/charts"
  chart            = "keda"
  create_namespace = true
  namespace        = "kedacore"
}

resource "helm_release" "monitoring" {
  count = var.monitoring ? 1 : 0

  depends_on = [
    kind_cluster.default
  ]

  name             = "prometheus-community"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  create_namespace = true
  namespace        = "monitoring"
}