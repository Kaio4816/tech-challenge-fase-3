output "rds_endpoints" {
  value = aws_db_instance.postgres[*].address
}