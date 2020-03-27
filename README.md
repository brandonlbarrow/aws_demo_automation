# aws_demo_automation

This project encompasses two main components, `demo_service` and `demo_vpc`.

`demo_service` contains the Terraform code required to stand up and tear down a basic AWS service using Elastic Load Balancing, EC2+Autoscaling and ElastiCache Redis. It assumes an existing VPC, subnet and security groups. It can accept these as input variables or via additional configuration as needed to allow for configuring this service architecture in another VPC. Alternatively, it could be made into a Terraform module for easier parameterization and sharing in other Terraform configurations - it depends on the patterns your organization is using.

`demo_vpc` contains a folder, `us-east-1` with the Terraform code, if desirable, to use to build one of the VPCs in the attached network diagram.

![Service Diagram](https://aws-demo-resources.s3.amazonaws.com/aws_demo_diagram.png)