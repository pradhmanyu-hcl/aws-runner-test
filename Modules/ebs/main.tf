#Create an ebs volume
resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = var.availability_zone
    size = var.volume_size
    type = var.volume_type
    tags = {
        Name = var.tags
    }
}