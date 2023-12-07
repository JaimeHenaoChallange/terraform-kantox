########################################################
# Recurso Role Lambda
########################################################

############## Recurso Role IAM Lambdas #######################
resource "aws_iam_role" "lambda-jedi" {
    name               = join("-", tolist(["iamrole", var.cliente, var.environment, "lambda-jedi"]))
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal": {
        "Service": "lambda.amazonaws.com"
        },
    "Effect": "Allow",
    "Sid": ""
    }
    ]
}
EOF
}


################## Recurso Policy IAM Lambdas #####################
resource "aws_iam_policy" "lambda-jedi" {
    name = join("-", tolist(["iamplcy", var.cliente, var.environment, "lambda-jedi"]))
    policy = jsonencode(
    {
        "Version" : "2012-10-17",
        "Statement" : [
        {
            "Sid" : "VisualEditor0",
            "Effect" : "Allow",
            "Action" : [
                "secretsmanager:GetRandomPassword",
                "secretsmanager:ListSecrets"
            ],
            "Resource" : "*"
        },
        {
            "Sid" : "VisualEditor1",
            "Effect" : "Allow",
            "Action" : "secretsmanager:*",
            "Resource" : [
                "*"
            ]
        },
        {
            "Effect" : "Allow",
            "Action" : [
            "dynamodb:*",
            "dax:*",
            "application-autoscaling:DeleteScalingPolicy",
            "application-autoscaling:DeregisterScalableTarget",
            "application-autoscaling:DescribeScalableTargets",
            "application-autoscaling:DescribeScalingActivities",
            "application-autoscaling:DescribeScalingPolicies",
            "application-autoscaling:PutScalingPolicy",
            "application-autoscaling:RegisterScalableTarget",
            "cloudwatch:DeleteAlarms",
            "cloudwatch:DescribeAlarmHistory",
            "cloudwatch:DescribeAlarms",
            "cloudwatch:DescribeAlarmsForMetric",
            "cloudwatch:GetMetricStatistics",
            "cloudwatch:ListMetrics",
            "cloudwatch:PutMetricAlarm",
            "cloudwatch:GetMetricData",
            "datapipeline:ActivatePipeline",
            "datapipeline:CreatePipeline",
            "datapipeline:DeletePipeline",
            "datapipeline:DescribeObjects",
            "datapipeline:DescribePipelines",
            "datapipeline:GetPipelineDefinition",
            "datapipeline:ListPipelines",
            "datapipeline:PutPipelineDefinition",
            "datapipeline:QueryObjects",
            "ec2:DescribeVpcs",
            "ec2:DescribeSubnets",
            "ec2:DescribeSecurityGroups",
            "iam:GetRole",
            "iam:ListRoles",
            "kms:DescribeKey",
            "kms:ListAliases",
            "sns:CreateTopic",
            "sns:DeleteTopic",
            "sns:ListSubscriptions",
            "sns:ListSubscriptionsByTopic",
            "sns:ListTopics",
            "sns:Subscribe",
            "sns:Unsubscribe",
            "sns:SetTopicAttributes",
            "lambda:CreateFunction",
            "lambda:ListFunctions",
            "lambda:ListEventSourceMappings",
            "lambda:CreateEventSourceMapping",
            "lambda:DeleteEventSourceMapping",
            "lambda:GetFunctionConfiguration",
            "lambda:DeleteFunction",
            "resource-groups:ListGroups",
            "resource-groups:ListGroupResources",
            "resource-groups:GetGroup",
            "resource-groups:GetGroupQuery",
            "resource-groups:DeleteGroup",
            "resource-groups:CreateGroup",
            "tag:GetResources",
            "kinesis:ListStreams",
            "kinesis:DescribeStream",
            "kinesis:DescribeStreamSummary"
        ],
        "Resource" : "*"
        },
        {
            "Action" : "cloudwatch:GetInsightRuleReport",
            "Effect" : "Allow",
          "Resource" : "arn:aws:cloudwatch:*:*:insight-rule/DynamoDBContributorInsights*"
        },
        {
          "Action" : [
            "iam:PassRole"
          ],
          "Effect" : "Allow",
          "Resource" : "*",
          "Condition" : {
            "StringLike" : {
              "iam:PassedToService" : [
                "application-autoscaling.amazonaws.com",
                "application-autoscaling.amazonaws.com.cn",
                "dax.amazonaws.com"
              ]
            }
          }
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "iam:CreateServiceLinkedRole"
          ],
          "Resource" : "*",
          "Condition" : {
            "StringEquals" : {
              "iam:AWSServiceName" : [
                "replication.dynamodb.amazonaws.com",
                "dax.amazonaws.com",
                "dynamodb.application-autoscaling.amazonaws.com",
                "contributorinsights.dynamodb.amazonaws.com",
                "kinesisreplication.dynamodb.amazonaws.com"
              ]
            }
          }
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "sns:Publish"
          ],
          "Resource" : "arn:aws:sns:*:046158258884:*"
        }
      ]
  })
}


################# Recurso Attachent Police ###################
resource "aws_iam_role_policy_attachment" "lambda_policy-jedi" {
  for_each = toset([
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  ])
  role       = aws_iam_role.lambda-jedi.name
  policy_arn = each.value
}

resource "aws_iam_role_policy_attachment" "role-attachment_lambda_policy-jedi" {
  role       = aws_iam_role.lambda-jedi.name
  policy_arn = aws_iam_policy.lambda-jedi.arn
}