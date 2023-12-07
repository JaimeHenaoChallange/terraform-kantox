######################################################################
# Module VPC
######################################################################
module "VPC" {
  source      = "./VPC"
  cliente     = var.cliente
  environment = var.environment
  aws_region  = var.aws_region
}

######################################################################
# Module LAMBDA
######################################################################
module "LAMBDA" {
  source        = "./LAMBDA"
  cliente       = var.cliente
  environment   = var.environment
  aws_region    = var.aws_region
  sublambda_sgr = module.VPC.sublambda_sgr
  sublambda     = module.VPC.sublambda
}

# ######################################################################
# # Module DYNAMODB
# ######################################################################
# module "DYNAMODB" {
#   source                       = "./DYNAMODB"
#   cliente                      = var.cliente
#   workload                     = var.workload
#   environment                  = var.environment
#   aws_region                   = var.aws_region
#   arn_lambda_orderstage2       = module.LAMBDA.arn_lambda_orderstage2
#   arn_lambda_orderstage2clicoh = module.LAMBDA.arn_lambda_orderstage2clicoh
#   arn_lambda_pricestage2       = module.LAMBDA.arn_lambda_pricestage2
#   arn_lambda_inventorystage2   = module.LAMBDA.arn_lambda_inventorystage2
#   arn_lambda_masterdatastage2  = module.LAMBDA.arn_lambda_masterdatastage2
# }





