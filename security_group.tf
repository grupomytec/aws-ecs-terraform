resource "aws_security_group" "ecs" {
  name        = var.name
  description = "Allows access from the ALB only"
  vpc_id      = var.vpc_id
  tags        = var.tags

  ingress {
    protocol    = "tcp"
    from_port   = var.task_port
    to_port     = var.task_port
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
