data "aws_instance" "webserver"{
instance_id = "i-0f87b57c5acf351bb"
}

resource "aws_instance" "webserver" {
    ami = data.aws_instance.webserver.ami
    instance_type = "t2.small"
    security_groups = data.aws_instance.webserver.security_groups
    key_name =data.aws_instance.webserver.key_name
    user_data = file("flower.sh")
  tags ={
    Name = "data-test"
  }
}