module "reflex_aws_ec2_instance_termination_protection_disabled" {
  source           = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe_lambda?ref=v0.5.7"
  rule_name        = "InstanceTerminationProtectionDisabled"
  rule_description = "Rule to detect when an ec2 instance has instance protection disabled."

  event_pattern = <<PATTERN
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "ec2.amazonaws.com"
    ],
    "eventName": [
      "ModifyInstanceAttribute"
    ]
  }
}
PATTERN

  function_name   = "InstanceTerminationProtectionDisabled"
  source_code_dir = "${path.module}/source"
  handler         = "reflex_aws_ec2_instance_termination_protection_disabled.lambda_handler"
  lambda_runtime  = "python3.7"
  environment_variable_map = {
    SNS_TOPIC = var.sns_topic_arn,
    
  }



  queue_name    = "InstanceTerminationProtectionDisabled"
  delay_seconds = 0

  target_id = "InstanceTerminationProtectionDisabled"

  sns_topic_arn  = var.sns_topic_arn
  sqs_kms_key_id = var.reflex_kms_key_id
}
