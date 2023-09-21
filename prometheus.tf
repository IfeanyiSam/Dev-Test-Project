provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"  
  }
}

resource "helm_release" "kube_prometheus" {
  name       = "kube-prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = "monitoring"  
  create_namespace = true

  set {
    name  = "prometheus.prometheusSpec.retention"
    value = "30d"  
  }
}
