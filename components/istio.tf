resource "helm_release" "base" {
  name             = "istio-base"
  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "base"
  version          = "1.13.1"
  namespace        = "istio-system"
  create_namespace = "true"
}

resource "helm_release" "istiod" {
  name             = "istiod"
  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "istiod"
  version          = "1.13.1"
  namespace        = "istio-system"
  create_namespace = "true"
  depends_on = [
    helm_release.base
  ]
}

resource "kubernetes_namespace" "istio-ingress" {
  metadata {
    labels = {
      istio-injection = "enabled"
    }
    name = "istio-ingress"
  }
}

resource "helm_release" "istio-ingress" {
  name       = "istio-ingress"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "gateway"
  version    = "1.13.1"
  namespace  = kubernetes_namespace.istio-ingress.metadata.0.name
  depends_on = [helm_release.istiod]
}