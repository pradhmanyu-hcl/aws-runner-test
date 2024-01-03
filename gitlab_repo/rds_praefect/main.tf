#Security group for rds
resource "aws_security_group" "sgrds_praefect" {
  vpc_id = var.vpc_id
  name = var.sgrds_praefect_name
  tags = {
    Name = var.sgrds_praefect_tags
  }
}

resource "aws_security_group_rule" "sgrdspraefectrule1" {
  security_group_id = aws_security_group.sgrds_praefect.id
  type = var.sgrds_praefect_type
  from_port = var.sgrds_praefect_from_port
  to_port = var.sgrds_praefect_to_port
  protocol = var.sgrds_praefect_protocol
  cidr_blocks = [var.vpc_cidr]
}

#RDS for PostgreSQL
resource "aws_db_subnet_group" "rds_praefect" {
  name = var.subnet_group_name_praefect
  description = var.subnet_group_desc_praefect
  subnet_ids = var.subnet_ids
}

resource "aws_db_parameter_group" "pg_praefect" {
  name = var.parameter_group_name_praefect
  description = var.parameter_group_desc_praefect
  family = var.family_praefect
}

#iam role for enhanced monitoring
resource "aws_iam_role" "rds_praefect" {
  name = var.rdspraefect_role
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "monitoring.rds.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  }
  EOF
}

#iam policy attachment
resource "aws_iam_role_policy_attachment" "rds_praefect" {
  role = aws_iam_role.rds_praefect.name
  policy_arn = "arn:aws-us-gov:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

resource "aws_db_instance" "postgres_praefect" {
  identifier = var.identifier_praefect
  allocated_storage = var.allocated_storage_praefect
  db_name = var.db_name_praefect
  instance_class = var.db_instance_class_praefect
  vpc_security_group_ids = [aws_security_group.sgrds_praefect.id]
  engine = var.engine_praefect
  engine_version = var.engine_version_praefect
  skip_final_snapshot = var.skip_final_snapshot_praefect
  db_subnet_group_name = aws_db_subnet_group.rds_praefect.id
  parameter_group_name = aws_db_parameter_group.pg_praefect.id
  storage_type = var.storage_type_praefect
  storage_encrypted = var.storage_encrypted_praefect
  multi_az = var.multi_az_praefect
  username = var.username_praefect
  password = var.password_praefect
  backup_retention_period = var.db_retention_days_praefect
  backup_window = var.backup_window_praefect
  maintenance_window = var.maintenance_window_praefect
  enabled_cloudwatch_logs_exports = ["postgresql"]
  performance_insights_enabled = var.performance_insights_enabled_praefect
  monitoring_interval = var.monitoring_interval_praefect
  monitoring_role_arn = aws_iam_role.rds_praefect.arn
  tags = {
    Name = var.rdspraefect_tags
  }
}

resource "aws_cloudwatch_log_group" "postgres_praefect" {
  name = "/aws/rds/instance/${aws_db_instance.postgres_praefect.id}/postgresql"
  retention_in_days = var.db_log_retention_praefect
}
