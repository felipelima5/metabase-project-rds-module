
# Trust Relationship
data "aws_iam_policy_document" "rds_assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}

#Anexando Policy
resource "aws_iam_role_policy" "rds_monitoring_get_policy" {
  name   = "Policy-Enhanced-Monitoring-RDS-${terraform.workspace}-${random_password.rds_role_name_sufixo.result}"
  role   = aws_iam_role.rds_monitoring_role.id
  policy = data.aws_iam_policy_document.rds_monitoring_policy.json
}

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