terraform {
  backend "s3" {
    bucket         = "dsn-drupal"
    key            = "drupal/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
