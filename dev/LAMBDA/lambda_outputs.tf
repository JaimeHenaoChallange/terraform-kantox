# # ################################################################################
# # # Outpout Modulo de Lambda DEV
# # ################################################################################

output "manifest_bucket_name" {
    value = aws_s3_bucket.manifest_bucket.bucket
}

output "arn_lambda_jedi" {
  description = "Output ARN Lambda jedi"
  value       = aws_lambda_function.jedi.arn
  sensitive   = false
}