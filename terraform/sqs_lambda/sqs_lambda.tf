module "sqs_lambda" {
  source = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/sqs_lambda?ref=v2.0.1"

  cloudwatch_event_rule_id  = var.cloudwatch_event_rule_id
  cloudwatch_event_rule_arn = var.cloudwatch_event_rule_arn
  function_name             = "Ec2InstanceTerminationProtectionDisabled"
  package_location          = var.package_location
  handler                   = "reflex_aws_ec2_instance_termination_protection_disabled.lambda_handler"
  lambda_runtime            = "python3.7"
  environment_variable_map = {
    SNS_TOPIC = var.sns_topic_arn,

  }



  queue_name    = "Ec2InstanceTerminationProtectionDisabled"
  delay_seconds = 0

  target_id = "Ec2InstanceTerminationProtectionDisabled"

  sns_topic_arn  = var.sns_topic_arn
  sqs_kms_key_id = var.reflex_kms_key_id
}
