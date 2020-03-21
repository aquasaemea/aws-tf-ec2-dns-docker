#AWS (terraform aws credentials)
AWS_ACCESS_KEY_ID= " "
AWS_SECRET_ACCESS_KEY= " "
AWS_DEFAULT_REGION= " "
#Terraform (ec2)
TF_VAR_client_name= "mycompany"
TF_VAR_product= "conjur"
TF_VAR_environment= "dev"
TF_VAR_region= "eu-west-2"
TF_VAR_instance_type-= "t2.large"
TF_VAR_subnet= "10.0.2.0/24"
TF_VAR_r53_zoneid_public= " "
TF_VAR_dns_public_namea= "mycompany-dap-dev"
TF_VAR_ssh_key_name= "my-ssh-key-name"
## AWS AMI 
#TF_VAR_aws_ami= "CentOS Linux 7 x86_64 HVM EBS ENA 1901_01-b7*"
#TF_VAR_owner_ami= "679593333241"
#TF_VAR_ssh_user= "centos"
#TF_VAR_ssh_script= "docker_conjur_master.sh"    #[ami_conjur_master.sh  or docker_conjur_master.sh]
#TF_VAR_aws_ami: CyberArk-DAP-10.10*
#TF_VAR_owner_ami: 601277729239