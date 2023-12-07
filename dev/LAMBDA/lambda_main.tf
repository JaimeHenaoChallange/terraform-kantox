# #######################################################
# #Recurso Lambdas
# #######################################################

resource "aws_lambda_function" "jedi" {
  # checkov:skip=CKV_AWS_116: ADD REASON
  # checkov:skip=CKV_AWS_50: ADD REASON
    s3_bucket     = aws_s3_bucket.lambda-bucket-codigo.id
    s3_key        = var.s3
    function_name = join("-", tolist([var.cliente, var.environment, "jedi"]))
    description   = ""
    role          = aws_iam_role.lambda-jedi.arn
    handler       = "handler.lambda_handler"
    runtime       = "python3.8"
    memory_size   = "256"
    timeout       = "30"
    environment {
        variables = {
            MANIFEST_BUCKET = aws_s3_bucket.manifest_bucket.bucket
        }
    }

    vpc_config {
        security_group_ids = [var.sublambda_sgr]
        subnet_ids         = ["${var.sublambda[0]}"]
    }

    tags = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "jedi"]))}" })
}

