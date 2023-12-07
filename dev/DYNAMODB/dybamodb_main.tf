# ###############################################################################
# # DynamoDB - orderstage2
# ###############################################################################

# resource "aws_dynamodb_table" "orderstage2" {
#   name             = join("-", tolist(["dynamodb", var.cliente, var.workload, var.environment, "orderstage2"]))
#   billing_mode     = var.billing_mode[0]
#   read_capacity    = 3
#   write_capacity   = 1
#   stream_view_type = var.view_type[1]
#   stream_enabled   = "true"
#   hash_key         = "OrderId"
#   range_key        = "Status"
#   attribute {
#     name = "OrderId"
#     type = "S"
#   }

#   attribute {
#     name = "Status"
#     type = "S"
#   }

#   tags = merge({ Name = "${join("-", tolist(["dynamodb", var.cliente, var.workload, var.environment, "orderstage2"]))}" })
# }

# ################################################################################
# # Recursos DynamoDB orderstage2 - Lambda Trigger Event
# ################################################################################
# resource "aws_lambda_event_source_mapping" "orderstage2" {
#   event_source_arn  = aws_dynamodb_table.orderstage2.stream_arn
#   function_name     = var.arn_lambda_orderstage2
#   starting_position = "LATEST"
#   batch_size        = 1
#   destination_config {
#         on_failure {
#                 destination_arn = "arn:aws:sns:us-east-1:805781348672:sns-ramo-vtex-dev-dead-letter"
#         }
#     }
# }


# ################################################################################
# # Recursos DynamoDB orderstage2clicoh - Lambda Trigger Event
# ################################################################################
# resource "aws_lambda_event_source_mapping" "orderstage2clicoh" {
#   event_source_arn  = aws_dynamodb_table.orderstage2.stream_arn
#   function_name     = var.arn_lambda_orderstage2clicoh
#   starting_position = "LATEST"
#   batch_size        = 1
#   destination_config {
#   on_failure {
#           destination_arn = "arn:aws:sns:us-east-1:805781348672:sns-ramo-vtex-dev-dead-letter"
#     }
#   }
# }

# ###############################################################################
# # DynamoDB - pricestage2
# ###############################################################################

# resource "aws_dynamodb_table" "pricestage2" {
#   name             = join("-", tolist(["dynamodb", var.cliente, var.workload, var.environment, "pricestage2"]))
#   billing_mode     = var.billing_mode[0]
#   read_capacity    = 3
#   write_capacity   = 1
#   stream_view_type = var.view_type[1]
#   stream_enabled   = "true"
#   hash_key         = "SkuId"

#   attribute {
#     name = "SkuId"
#     type = "S"
#   }

#   tags = merge({ Name = "${join("-", tolist(["dynamodb", var.cliente, var.workload, var.environment, "pricestage2"]))}" })
# }

# ################################################################################
# # Recursos DynamoDB pricestage2 - Lambda Trigger Event
# ################################################################################
# resource "aws_lambda_event_source_mapping" "pricestage2" {
#   event_source_arn               = aws_dynamodb_table.pricestage2.stream_arn
#   function_name                  = var.arn_lambda_pricestage2
#   bisect_batch_on_function_error = true
#   starting_position              = "LATEST"
#   batch_size                     = 8
#   destination_config {
#       on_failure {
#               destination_arn = "arn:aws:sns:us-east-1:805781348672:sns-ramo-vtex-dev-dead-letter"
#        }
#     }
# }

# ###############################################################################
# # DynamoDB - inventorystage2
# ###############################################################################

# resource "aws_dynamodb_table" "inventorystage2" {
#   name             = join("-", tolist(["dynamodb", var.cliente, var.workload, var.environment, "inventorystage2"]))
#   billing_mode     = var.billing_mode[0]
#   read_capacity    = 3
#   write_capacity   = 1
#   stream_view_type = var.view_type[1]
#   stream_enabled   = "true"
#   hash_key         = "SkuId"
#   range_key        = "CenterSap"

#   attribute {
#     name = "SkuId"
#     type = "S"
#   }
#   attribute {
#     name = "CenterSap"
#     type = "S"
#   }

#   tags = merge({ Name = "${join("-", tolist(["dynamodb", var.cliente, var.workload, var.environment, "inventorystage2"]))}" })
# }

# ################################################################################
# # Recursos DynamoDB inventorystage2 - Lambda Trigger Event
# ################################################################################
# resource "aws_lambda_event_source_mapping" "inventorystage2" {
#   event_source_arn               = aws_dynamodb_table.inventorystage2.stream_arn
#   function_name                  = var.arn_lambda_inventorystage2
#   bisect_batch_on_function_error = true
#   starting_position              = "LATEST"
#   batch_size                     = 8
#   destination_config {
#     on_failure {
#             destination_arn = "arn:aws:sns:us-east-1:805781348672:sns-ramo-vtex-dev-dead-letter"
#      }
#   }
# }

# ###############################################################################
# # DynamoDB - masterdatastage2
# ###############################################################################

# resource "aws_dynamodb_table" "masterdatastage2" {
#   name             = join("-", tolist(["dynamodb", var.cliente, var.workload, var.environment, "masterdatastage2"]))
#   billing_mode     = var.billing_mode[0]
#   read_capacity    = 3
#   write_capacity   = 1
#   stream_view_type = var.view_type[1]
#   stream_enabled   = "true"
#   hash_key         = "SkuId"
#   range_key        = "ProductId"

#   attribute {
#     name = "SkuId"
#     type = "S"
#   }
#   attribute {
#     name = "ProductId"
#     type = "S"
#   }

#   tags = merge({ Name = "${join("-", tolist(["dynamodb", var.cliente, var.workload, var.environment, "masterdatastage2"]))}" })
# }

# ################################################################################
# # Recursos DynamoDB masterdatastage2 - Lambda Trigger Event
# ################################################################################
# resource "aws_lambda_event_source_mapping" "masterdatastage2" {
#   event_source_arn  = aws_dynamodb_table.masterdatastage2.stream_arn
#   function_name     = var.arn_lambda_masterdatastage2
#   starting_position = "LATEST"
#   batch_size        = 1
#   destination_config {
#         on_failure {
#                 destination_arn = "arn:aws:sns:us-east-1:805781348672:sns-ramo-vtex-dev-dead-letter"
#         }
#     }
# }