# ###############################################################################
# # Bucket S3 codigo lambda
# ###############################################################################

resource "aws_s3_bucket" "lambda-bucket-codigo" {
    bucket = join("-", tolist([var.cliente, var.environment, "s3-bucket-codigo"]))
    tags   = merge({ Name = "${join("-", tolist([var.cliente, var.environment, "s3-bucket-codigo"]))}" })

    lifecycle {
    prevent_destroy = "true"
    }
}

# ###############################################################################
# # Bucket manifiestos JEDI
# ###############################################################################

resource "aws_s3_bucket" "manifest_bucket" {
    bucket = join("-", tolist([var.cliente, var.environment, "jedi-manifests"]))

    lifecycle {
    prevent_destroy = "true"
    }
}
