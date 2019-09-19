provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = "manak8s"
  region  = "fra1"  # Frankfurt 1
  version = "1.15.3-do.2"

  node_pool {
    name       = "pool1"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}
