module "ec2" {
    source = "../terraform-aws-ec2"
    # these are variables expected module, not arguments of resource definition
    # You can also create variables or else you can directly use values here
    ami_id = var.ami_something
    instance_type = "t3.large"
    security_group_ids = ["sg-0fea5e49e962e81c9"]
}