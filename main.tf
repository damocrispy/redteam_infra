resource "aws_s3_bucket" "state_bucket" {
  bucket = "terraform-state-572f094e39"
}

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "ec2_vm" {
  ami           = "ami-041290b7cc4be2d3c"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.vm_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.vm_iam_profile.name

  tags = {
    Name = "Main"
  }

  user_data = file("./user_data.sh")

}

resource "aws_security_group" "vm_sg" {
  name   = "my_vm_sg"
  vpc_id = aws_default_vpc.default_vpc.id

  ingress {
    description = "HTTP ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_instance_profile" "vm_iam_profile" {
  name = "vm_profile"
  role = aws_iam_role.vm_iam_role.name
}

resource "aws_iam_role" "vm_iam_role" {
  name               = "vm_role"
  assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": {
"Effect": "Allow",
"Principal": {"Service": "ec2.amazonaws.com"},
"Action": "sts:AssumeRole"
}
}
EOF
  tags = {
    stack = "test"
  }
}

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.vm_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_lb_target_group" "target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default_vpc.id
  health_check {
    enabled  = true
    path     = "/health"
    port     = "80"
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.ec2_vm.id
  port             = 80
}

resource "aws_default_subnet" "default_subnet_a" {
  availability_zone = "eu-west-1a"
}

resource "aws_default_subnet" "default_subnet_b" {
  availability_zone = "eu-west-1b"
}

resource "aws_default_subnet" "default_subnet_c" {
  availability_zone = "eu-west-1c"
}

resource "aws_lb" "load_balancer" {
  name               = "my-load-balancer"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.vm_sg.id]

  subnet_mapping {
    subnet_id = aws_default_subnet.default_subnet_a.id
  }
  subnet_mapping {
    subnet_id = aws_default_subnet.default_subnet_b.id
  }
  subnet_mapping {
    subnet_id = aws_default_subnet.default_subnet_c.id
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
