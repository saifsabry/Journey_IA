resource "aws_default_security_group" "default" {
  vpc_id = var.vpc_id


  ingress {
    protocol  = "-1" # All protocols
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "oj_ecs_lb" {
  name        = "OJECSSecurityGroupLB-genai"
  description = "OJECSSecurityGroupLB-genai"
  vpc_id      = var.vpc_id

  ingress {
    description = "Free Ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "OJ"    = "OJ"
    "STAGE" = "genai"
  }
}
resource "aws_security_group" "global_accelerator" {
  name        = "GlobalAccelerator"
  description = "GlobalAccelerator configured SecurityGroup"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }



  tags = {
    AWSServiceName = "GlobalAccelerator"
  }
}


resource "aws_security_group" "oj_ecs_service" {
  name        = "OJECSSecurityGroup-genai"
  description = "OJECSSecurityGroup-genai"
  vpc_id      = var.vpc_id

  ingress {
    description = "Free Ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "OJ"    = "OJ"
    "STAGE" = "genai"
  }
}