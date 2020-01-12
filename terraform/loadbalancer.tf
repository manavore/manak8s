resource "kubernetes_service" "front" {
  metadata {
    name = "manak8s-front"

    annotations = {
      "service.beta.kubernetes.io/do-loadbalancer-protocol"              = "http"
      "service.beta.kubernetes.io/do-loadbalancer-healthcheck-path"      = "/ping"
      "service.beta.kubernetes.io/do-loadbalancer-algorithm"             = "round_robin"
      "service.beta.kubernetes.io/do-loadbalancer-enable-proxy-protocol" = "true"
      "service.beta.kubernetes.io/do-loadbalancer-enable-proxy-protocol" = "true"
    }
  }
  spec {
    selector = {
      app = kubernetes_deployment.proxy.metadata.0.labels.app
    }

    port {
      port        = 80
      target_port = 80
    }

    port {
      port        = 443
      target_port = 443
    }

    port {
      port        = 8080
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
