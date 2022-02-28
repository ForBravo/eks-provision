resource "helm_release" "kube-state-metrics" {
  name       = "kube-state-metrics"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-state-metrics"
  version    = "4.5.0"
  namespace  = "kube-system"
}