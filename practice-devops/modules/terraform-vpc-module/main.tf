module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = local.resource_name
  
  tags = merge(
    var.common_tags,
    {
        Name = local.resource_name
    }
  )
}