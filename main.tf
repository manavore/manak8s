terraform {
  backend "remote" {
    organization = "manavore"

    workspaces {
      name = "manak8s"
    }
  }
}


provider "digitalocean" {
  token = "${var.do_token}"
}

provider "kubernetes" {
  host = "${digitalocean_kubernetes_cluster.cluster.endpoint}"

  client_certificate     = "${base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_certificate)}"
  client_key             = "${base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)}"
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
