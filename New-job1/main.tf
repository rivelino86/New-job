data "aws_instance" "webserver1" {
    instance_id = "i-0f87b57c5acf351bb"
    
  
}

resource "null_resource" "n1" {
    provisioner "local-exec" {
        command = <<-EOF
                  echo "public_ip = ${data.aws_instance.webserver1.public_ip}" > project.txt 
                  echo "private_ip = ${data.aws_instance.webserver1.private_ip}" >> project.txt
                  echo "private_dns = ${data.aws_instance.webserver1.private_dns}" >> project.txt
                  echo "public_dns = ${data.aws_instance.webserver1.public_dns}" >> project.txt
                  echo "key_name = ${data.aws_instance.webserver1.key_name}" >> project.txt
                  echo "security_groups = ${join (",",data.aws_instance.webserver1.security_groups)}" >> project.txt
                  echo "security_group_ids = ${join (",",data.aws_instance.webserver1.vpc_security_group_ids)}" >> project.txt

        EOF 
        interpreter = [ "bash", "-c" ] 
    }

  
}
