resource "aws_db_instance" "drupal" {
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  username          = var.db_user
  password          = var.db_pass
  allocated_storage = 20
  name              = "drupaldb"
  skip_final_snapshot = true
  vpc_security_group_ids = [var.db_sg]
  db_subnet_group_name   = var.subnet_group
}
