
data "digitalocean_kubernetes_versions" "this" {}

resource "digitalocean_kubernetes_cluster" "this" {
  name    = "manak8s"
  region  = "sgp1"
  version = data.digitalocean_kubernetes_versions.this.latest_version

  node_pool {
    name       = "base"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}
