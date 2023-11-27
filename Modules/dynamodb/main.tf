# Create DynamoDB table
resource "aws_dynamodb_table" "basic-dynamodb-table" {
    name = var.basic-dynamodb-table
    billing_mode = var.billing_mode
    read_capacity = var.read_capacity
    write_capacity = var.write_capacity
    hash_key = var.hash_key
    range_key = var.range_key

    attribute {
        name = var.hash_key
        type = "S"        
    }
    attribute {
        name = var.range_key
        type = "S"       
    }
    ttl {
        attribute_name = var.ttl_attribute_name
        enabled = var.ttl_enabled       
    }

    # Create Global Secondary Index
    global_secondary_index {
        name = var.gsi_name
        hash_key = var.hash_key
        range_key = var.range_key
        write_capacity = var.read_capacity
        read_capacity = var.write_capacity
        projection_type = "INCLUDE"
        non_key_attributes = ["UserId"]
    }
    tags = {
        Name = var.tags
    }
}