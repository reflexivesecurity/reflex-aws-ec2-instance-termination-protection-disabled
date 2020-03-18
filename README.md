# reflex-aws-ec2-instance-termination-protection-disabled
A rule to detect if instance termination protection has been disabled for an ec2 instance.

## Usage
To use this rule either add it to your `reflex.yaml` configuration file:  
```
rules:
  - reflex-aws-ec2-instance-termination-protection-disabled:
    versions: version
```

or add it directly to your Terraform:  
```
...

module "reflex-aws-ec2-instance-termination-protection-disabled" {
  source           = "github.com/cloudmitigator/reflex-aws-ec2-instance-termination-protection-disabled"
}

...
```

## License
This Reflex rule is made available under the MPL 2.0 license. For more information view the [LICENSE](https://github.com/cloudmitigator/reflex-aws-ec2-instance-termination-protection-disabled/blob/master/LICENSE) 
