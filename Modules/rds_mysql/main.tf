#RDS for mysql
resource "aws_db_subnet_group" "rds-subnet" {
  name = var.subnet_group_name
  description = var.subnet_group_desc
  subnet_ids = var.subnet_ids
}

resource "aws_db_parameter_group" "rds-parameter" {
  name = var.parameter_group_name
  description = var.parameter_group_desc
  family = var.family
}

resource "aws_db_instance" "mysql" {
  allocated_storage = var.allocated_storage
  identifier = var.identifier
  db_name = var.db_name
  engine = var.engine
  vpc_security_group_ids = [var.sgdatabase_id]
  engine_version = var.engine_version
  instance_class = var.db_instance_class
  username = var.username
  password = var.password
  parameter_group_name = aws_db_parameter_group.rds-parameter.id
  db_subnet_group_name = aws_db_subnet_group.rds-subnet.id
  storage_type = var.storage_type
  storage_encrypted = var.storage_encrypted
  skip_final_snapshot = var.skip_final_snapshot
  multi_az = var.multi_az
  tags = {
    Name = var.rds_tags
  }
}

resource "aws_db_snapshot" "mysql" {
  db_instance_identifier = aws_db_instance.mysql.identifier
  db_snapshot_identifier = "snapshot-${aws_db_instance.mysql.identifier}"
}