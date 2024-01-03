<<<<<<< HEAD
#Security group for rds
resource "aws_security_group" "sgrds" {
  vpc_id = var.vpc_id
  name = var.sgrds_name
  tags = {
    Name = var.sgrds_tags
  }
}

resource "aws_security_group_rule" "sgrdsrule1" {
  security_group_id = aws_security_group.sgrds.id
  type = var.sgrds_type
  from_port = var.sgrds_from_port
  to_port = var.sgrds_to_port
  protocol = var.sgrds_protocol
  cidr_blocks = [var.vpc_cidr]
}

#RDS for PostgreSQL
resource "aws_db_subnet_group" "rds-subnet" {
  name = var.subnet_group_name
  description = var.subnet_group_desc
  subnet_ids = var.subnet_ids
}

resource "aws_db_parameter_group" "pg" {
  name = var.parameter_group_name
  description = var.parameter_group_desc
  family = var.family
}

#iam role for enhanced monitoring
resource "aws_iam_role" "rds" {
  name = var.rds_role
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
resource "aws_iam_role_policy_attachment" "rds" {
  role = aws_iam_role.rds.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

resource "aws_db_instance" "postgres" {
  identifier = var.identifier
  allocated_storage = var.allocated_storage
  db_name = var.db_name
  instance_class = var.db_instance_class
  vpc_security_group_ids = [aws_security_group.sgrds.id]
  engine = var.engine
  engine_version = var.engine_version
  skip_final_snapshot = var.skip_final_snapshot
  db_subnet_group_name = aws_db_subnet_group.rds-subnet.id
  parameter_group_name = aws_db_parameter_group.pg.id
  storage_type = var.storage_type
  storage_encrypted = var.storage_encrypted
  multi_az = var.multi_az
  username = var.username
  password = var.password
  backup_retention_period = var.db_retention_days
  backup_window = var.backup_window
  maintenance_window = var.maintenance_window
  enabled_cloudwatch_logs_exports = ["postgresql"]
  performance_insights_enabled = var.performance_insights_enabled
  monitoring_interval = var.monitoring_interval
  monitoring_role_arn = aws_iam_role.rds.arn
  tags = {
    Name = var.rds_tags
  }
}

resource "aws_cloudwatch_log_group" "postgres" {
  name = "/aws/rds/instance/${aws_db_instance.postgres.id}/postgresql"
  retention_in_days = var.db_log_retention
}

=======
#Security group for rds
resource "aws_security_group" "sgrds" {
  vpc_id = var.vpc_id
  name = var.sgrds_name
  tags = {
    Name = var.sgrds_tags
  }
}

resource "aws_security_group_rule" "sgrdsrule1" {
  security_group_id = aws_security_group.sgrds.id
  type = var.sgrds_type
  from_port = var.sgrds_from_port
  to_port = var.sgrds_to_port
  protocol = var.sgrds_protocol
  cidr_blocks = [var.vpc_cidr]
}

#RDS for PostgreSQL
resource "aws_db_subnet_group" "rds-subnet" {
  name = var.subnet_group_name
  description = var.subnet_group_desc
  subnet_ids = var.subnet_ids
}

resource "aws_db_parameter_group" "pg" {
  name = var.parameter_group_name
  description = var.parameter_group_desc
  family = var.family
}

#iam role for enhanced monitoring
resource "aws_iam_role" "rds" {
  name = var.rds_role
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
resource "aws_iam_role_policy_attachment" "rds" {
  role = aws_iam_role.rds.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

resource "aws_db_instance" "postgres" {
  identifier = var.identifier
  allocated_storage = var.allocated_storage
  db_name = var.db_name
  instance_class = var.db_instance_class
  vpc_security_group_ids = [aws_security_group.sgrds.id]
  engine = var.engine
  engine_version = var.engine_version
  skip_final_snapshot = var.skip_final_snapshot
  db_subnet_group_name = aws_db_subnet_group.rds-subnet.id
  parameter_group_name = aws_db_parameter_group.pg.id
  storage_type = var.storage_type
  storage_encrypted = var.storage_encrypted
  multi_az = var.multi_az
  username = var.username
  password = var.password
  backup_retention_period = var.db_retention_days
  backup_window = var.backup_window
  maintenance_window = var.maintenance_window
  enabled_cloudwatch_logs_exports = ["postgresql"]
  performance_insights_enabled = var.performance_insights_enabled
  monitoring_interval = var.monitoring_interval
  monitoring_role_arn = aws_iam_role.rds.arn
  tags = {
    Name = var.rds_tags
  }
}

resource "aws_cloudwatch_log_group" "postgres" {
  name = "/aws/rds/instance/${aws_db_instance.postgres.id}/postgresql"
  retention_in_days = var.db_log_retention
}

>>>>>>> 374f69e284680e4c00db5732080818999ea80ab9
