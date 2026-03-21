resource "aws_db_subnet_group" "db-snet-group" {
  name       = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "rds" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "RDS security group"
  vpc_id      = var.vpc_id
}

locals {
  databases = [
    "users-db",
    "orders-db",
    "inventory-db"
  ]
}

resource "aws_db_instance" "postgres" {
  count                  = length(local.databases)
  identifier             = "${var.project_name}-${local.databases[count.index]}"
  engine                 = "postgres"
  engine_version         = "16.13"
  instance_class         = var.db_instance_class
  allocated_storage      = 20
  max_allocated_storage  = 100
  storage_type           = "gp3"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db-snet-group.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot    = true
  publicly_accessible    = false
  multi_az               = false
  deletion_protection    = false
}