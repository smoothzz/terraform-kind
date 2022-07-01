resource "null_resource" "ips" {
  provisioner "local-exec" {
    command = "/bin/bash getIP.sh"
  }
}

resource "null_resource" "destroy" {
  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf ip.txt"
  }
}

data "local_file" "input" {
  depends_on = [
    null_resource.ips
  ]
  filename = "${path.module}/ip.txt"
}