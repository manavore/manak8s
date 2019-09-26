resource "kubernetes_deployment" "generic-deployment" {
  metadata {
    name = "${var.name}-deployment"
    labels = {
      test = "${var.name}-deployment"
    }
  }

  spec {
    replicas = "${var.replicas}"

    selector {
      match_labels = {
        test = "${var.name}-deployment"
      }
    }

    template {
      metadata {
        labels = {
          test = "${var.name}-deployment"
        }
      }

      spec {
        container {
          image = "${var.image}:${var.tag}"
          name  = "${var.name}"
          command = "${var.command != "" ? var.command : null}"

          dynamic "env" {
            for_each = [for env in var.envs: {
              name  = env.name
              value = env.value
            }]

            content {
              name  = env.value.name
              value = env.value.value
            }
          }
        }
      }
    }
  }
}
