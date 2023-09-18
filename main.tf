provider "kubectl" {
  config_path = "desktop/kube/.kube/config"  
}
resource "kubectl_manifest" "appdep" {
  yaml_body = <<-EOT
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: nodeapp-deployment
      labels:
        app: nodeapp
    spec:
      replicas: 2
      selector:
        matchLabels:
          app: nodeapp
      template:
        metadata:
          labels:
            app: nodeapp
        spec:
          containers:
            - name: nodeapp
              image: ifeanyisam/nodeapp:v11  
              ports:
                - containerPort: 8080  
  EOT
}
