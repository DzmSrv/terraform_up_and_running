resource "aws_db_instance" "example" {
  identifier_prefix   = "${var.environment}-mysql-db"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = var.db_instance_class
  name                = "${var.environment}db"
  username            = "admin"
  skip_final_snapshot = true
  # How should we set the password?
  password            = data.aws_secretsmanager_secret_version.db_password.secret_string
}

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = "mysql-master-password-stg"
}