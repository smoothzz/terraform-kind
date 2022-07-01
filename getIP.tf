resource "null_resource" "ips" {
  provisioner "local-exec" {
    command = "/bin/bash getIP.sh"
  }
}

data "local_file" "input" {
  depends_on = [
    null_resource.ips
  ]
  filename = "${path.module}/ip"
}