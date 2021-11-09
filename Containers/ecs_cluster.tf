resource "aws_ecs_cluster" "test-ecs-cluster" {
  name = "test-ecs"
  capacity_providers = ["FARGATE"]

  setting = {
    name  = "containerInsights"
    value = "disabled"
  }
}