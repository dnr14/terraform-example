resource "aws_elastic_beanstalk_application" "application" {
  # eb 어플리케이션 이름
  name = var.zaritalk-application
}

resource "aws_elastic_beanstalk_environment" "environment" {
  name                = "${var.zaritalk-application}-environment"
  application         = aws_elastic_beanstalk_application.application.name
  solution_stack_name = var.zaritalk-application-environment-os
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
}