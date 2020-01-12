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

          liveness_probe {
            http_get {
              path = "/ping"
              port = 80
            }

            initial_delay_seconds = 5
            period_seconds        = 10
          }
        }
      }
    }
  }
}
