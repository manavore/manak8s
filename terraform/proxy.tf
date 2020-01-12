resource "kubernetes_deployment" "proxy" {
  metadata {
    name = "proxy"
    labels = {
      app = "proxy"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "proxy"
      }
    }

    template {
      metadata {
        labels = {
          app = "proxy"
        }
      }

      spec {
        container {
          image = "traefik:1.2"
          name  = "proxy"

          port {
            name           = "http"
            container_port = 80
            protocol       = "TCP"
          }

          port {
            name           = "https"
            container_port = 443
            protocol       = "TCP"
          }

          port {
            name           = "dashboard"
            container_port = 8080
            protocol       = "TCP"
          }

          volume_mount {
            mount_path = "/etc/traefik/"
            name       = "proxy-config"
          }

          liveness_probe {
            http_get {
              path = "/ping"
              port = 80
            }

            initial_delay_seconds = 5
            period_seconds        = 10
          }
        }
        volume {
          name = "proxy-config"
          config_map {
            name = "proxy-config"
          }
        }
      }
    }
  }
}

resource "kubernetes_config_map" "proxy_config" {
  metadata {
    name = "proxy-config"
  }

  data = {
    "traefik.toml"       = "${file("${path.module}/configs/traefik.toml")}"
    "file_provider.toml" = "${file("${path.module}/configs/file_provider.toml")}"
  }
}
