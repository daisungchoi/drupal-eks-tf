resource "helm_release" "drupal" {
  name       = "drupal"
  namespace  = "default"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "drupal"
  version    = "18.2.4"

  set {
    name  = "mariadb.enabled"
    value = "false"
  }

  set {
    name  = "externalDatabase.host"
    value = module.rds.endpoint
  }

  set {
    name  = "externalDatabase.user"
    value = var.db_user
  }

  set {
    name  = "externalDatabase.password"
    value = var.db_pass
  }

  set {
    name  = "externalDatabase.database"
    value = "drupaldb"
  }
}
