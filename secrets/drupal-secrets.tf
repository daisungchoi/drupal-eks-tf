resource "kubernetes_secret" "drupal" {
  metadata {
    name = "drupal-secret"
  }

  data = {
    db_user = base64encode(var.db_user)
    db_pass = base64encode(var.db_pass)
  }
}
