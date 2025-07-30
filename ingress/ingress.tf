resource "helm_release" "ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  create_namespace = true
}

resource "kubernetes_ingress_v1" "drupal" {
  metadata {
    name      = "drupal-ingress"
    namespace = "default"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      host = "drupal.example.com"
      http {
        path {
          path     = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "drupal"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
