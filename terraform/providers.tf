provider "digitalocean" {
  token   = var.do_token
  version = "~> 1.12"
}

provider "kubernetes" {
  host    = digitalocean_kubernetes_cluster.cluster.endpoint
  version = "~> 1.10"

  client_certificate     = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_certificate)
  client_key             = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)
}
