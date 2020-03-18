""" Module for InstanceTerminationProtectionDisabled """

import json
import os

import boto3
from reflex_core import AWSRule


class InstanceTerminationProtectionDisabled(AWSRule):
    """ Rule to detect the termination of instance protection """


    def __init__(self, event):
        super().__init__(event)

    def extract_event_data(self, event):
        """ Extract required event data """
        self.ec2_instance_id = event["detail"]["requestParameters"]["instanceId"]
        self.request_parameters = event["detail"]["requestParameters"]

    def resource_compliant(self):
        """
        Determine if the resource is compliant with your rule.

        Return True if it is compliant, and False if it is not.
        """
        return self.request_parameters["disableApiTermination"]["value"]

    def get_remediation_message(self):
        """ Returns a message about the remediation action that occurred """
        return f"The ec2 instance {self.ec2_instance_id} has had instance termination protection disabled."


def lambda_handler(event, _):
    """ Handles the incoming event """
    rule = InstanceTerminationProtectionDisabled(json.loads(event["Records"][0]["body"]))
    rule.run_compliance_rule()
