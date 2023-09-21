provider "kubectl" {
  config_path = "~/.kube/config" 
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
              image: ifeanyisam/nodeapp:v1.1
              ports:
                - containerPort: 3000
  EOT
}

# Use a null_resource to trigger the kubectl apply operation
resource "null_resource" "apply_manifest" {
  triggers = {
    kubectl_manifest_ids = kubectl_manifest.appdep.id
  }

  provisioner "local-exec" {
    command = "kubectl apply -f nodeappdep.yml"  # Apply the Kubernetes manifest
    interpreter = ["bash", "-c"]
  }
}
