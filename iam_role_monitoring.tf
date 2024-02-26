#Policy
data "aws_iam_policy_document" "rds_monitoring_policy" {

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:PutRetentionPolicy"
    ]

    effect = "Allow"
    resources = [
      "arn:aws:logs:*:*:log-group:RDS*"
    ]

    sid = "EnableCreationAndManagementOfRDSCloudwatchLogGroups"
  }
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "logs:GetLogEvents"
    ]

    effect = "Allow"
    resources = [
      "arn:aws:logs:*:*:log-group:RDS*:log-stream:*"
    ]

    sid = "EnableCreationAndManagementOfRDSCloudwatchLogStreams"
  }
}

resource "random_password" "rds_role_name_sufixo" {
  length      = 10
  special     = false
  upper       = false
  lower       = false
  number      = true
  numeric     = true
  min_numeric = 10
}