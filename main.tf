resource "null_resource" "eck_init" {
  triggers = {
    hash = filesha256("${path.module}/config/elasticsearch-operator.yml")
  }

  provisioner "local-exec" {
    command = "kubectl -n ${var.kubectl_namespace} apply -f ${"${path.module}/config/elasticsearch-operator.yml"}"
  }
}
