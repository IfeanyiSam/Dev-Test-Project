provider "kubernetes" {
  config_path = "~desktop/kube/.kube/config"  # Path to your Kubernetes config file
}

provider "helm" {
  kubernetesconfig = "~/.kube/config"  # Path to your Kubernetes config file
}

resource "helm_release" "custom_prometheus" {
  name       = "your-release-name"  # Choose a unique release name
  repository = "https://custom-helm-repo.example.com"  # Update with your Helm chart repository
  chart      = "custom-prometheus-chart"  # Update with the Helm chart name you want to use
  namespace  = "your-namespace"  # Choose a namespace for deployment

  set {
    name  = "custom-chart-value1"  # Customize Helm chart values as needed
    value = "value1"
  }

  set {
    name  = "custom-chart-value2"
    value = "value2"
  }
}

output "prometheus_url" {
  value = "http://prometheus-server.your-namespace.svc.cluster.local"  # Update with your Prometheus URL
}

output "grafana_url" {
  value = "http://grafana-server.your-namespace.svc.cluster.local"  # Update with your Grafana URL
}
