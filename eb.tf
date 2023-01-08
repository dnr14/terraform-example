resource "aws_elastic_beanstalk_application" "application" {
  # eb 어플리케이션 이름
  name = var.my-awesome-app
}

resource "aws_elastic_beanstalk_environment" "environment" {
  name                = "my-awesome-environment"
  application         = aws_elastic_beanstalk_application.application.name
  solution_stack_name = "64bit Amazon Linux 2 v5.6.3 running Node.js 16"
  setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "IamInstanceProfile"
        value     = "aws-elasticbeanstalk-ec2-role"
      }
}