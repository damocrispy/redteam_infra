locals {
  subnets = [
    aws_default_subnet.default_subnet_a.id,
    aws_default_subnet.default_subnet_b.id,
    aws_default_subnet.default_subnet_c.id
  ]

  public_key = sensitive(file("~/.ssh/redteam_main.pub"))
}