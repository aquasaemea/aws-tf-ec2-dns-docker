# Terraform project: A Centos7 with docker on EC2 AWS 

**Description:** Terraform project to a Centos7 instance with Docker CE and docker-compose in an Amazon VPC subnet with an AWS secrutity group allowing only our current public IP to access SSH(22) and HTTPS(443.
In addition, a public DNS record is created in a given domain zone.


You may want to use [Summon](https://cyberark.github.io/summon/) which is opensource project mantain by [CyberArk](https://www.cyberark.com/) to fetch secrets from **Keychain** or **Conjur/DAP** and export them as env vars.


## Project Structure

```bash
|-- main.tf
|-- variables.tf
|-- outputs.tf
|-- stateconfig.tf
|-- tf.sh
```
### File Descriptions

**Filename**|**Description**
-----|-----
[main.tf](main.tf) | EC2 declaration. 
[variables.tf](variables.tf) | Variable initialisation.
[outputs.tf](outputs.tf) | Output definitions, to enable consumption of resources by other projects and modules. Keep this up to date with any additional resources created via the project.
[stateconfig.tf](stateconfig.tf) | Defines the type of remote state required (typically Amazon S3 Bucket) and (if required) any parameterised remote state definitions.
[tf.sh](tf.sh) | Wrapper script which runs terraform init to setup remote state, reading env vars if present to override default names/locations. Once the init has been performed it then makes a regular call to terraform, passing through all parameters verbatim.


## Module Usage

```
module "aws_ec2_docker" {
  source              = "git::git@github.com:andresguisado/aws-tfmodule-ec2-docker.git"
  client_name         = "${var.client_name}"
  product             = "${var.product}"
  environment         = "${var.environment}"
  region              = "${var.region}"
  instance_type       = "${var.instance_type}"
  subnet              = "${var.subnet}"
  ssh_key_name        = "${var.ssh_key_name}"
  r53_zoneid_public   = "${var.r53_zoneid_public}"
  dns_public_name     = "${var.dns_public_name}"
}
```

## AWS Requirements

- Creating AWS S3 Bucket in advanced as follows: ``` ${var.client_name}-terraform-state ```
- AWS EC2 SSH key access **uploaded in AWS in advanced**: ``` ${var.ssh_key_name} ```
- A domain in AWS Route53: ``` ${var.r53_zoneid_public} ```


# Usage 

## Terraform 

### Requirements 
- Install Terraform
- Install AWS CLI
- Getting **AWS_API_KEY** and **AWS_API_SECRET** and put it in ``` example.tfvars ```
- Reviewing ``` example.tfvars** ```

### Apply

```bash
> ./tf.sh apply -auto-approve -var-file="example.tfvars"
```

### Destroy

```bash
> ./tf.sh destroy -auto-approve -var-file="example.tfvars"
```

## Summon Usage - Keyring

### Requirements 
- Install Terraform
- Install AWS CLI
- [Install Summon](https://github.com/cyberark/summon#install)
- [Installing Summon Key Ring provider](https://github.com/cyberark/summon-keyring#install)
- Getting **AWS_API_KEY** and **AWS_API_SECRET**
- Reviewing **secrets.yml** according to secrets created in [Keyring](https://github.com/cyberark/summon-keyring#example).

### Apply

```bash
> summon -p ring.py ./tf.sh plan -out=tfplan.out

> summon -p ring.py ./tf.sh apply -auto-approve tfplan.out
```

### Destroy

```bash
> summon -p ring.py ./tf.sh plan -destroy -out=tfdestroyplan.out

> summon -p ring.py ./tf.sh destroy -auto-approve 
```

## Summon Usage - Conjur/DAP 

### Requirements 
- Install Terraform
- Install AWS CLI
- [Install Summon](https://github.com/cyberark/summon#install)
- [Installing Summon Conjur provider](https://github.com/cyberark/summon-conjur#install)
- [Summon Configuration](https://github.com/cyberark/summon-conjur#configuration)
- Getting **AWS_API_KEY** and **AWS_API_SECRET**
- Reviewing **secrets.yml** according to secrets created in Conjur.

### Apply

```bash
> summon -p summon-conjur ./tf.sh plan -out=tfplan.out

> summon -p summon-conjur ./tf.sh apply -auto-approve tfplan.out
```

### Destroy

```bash
> summon -p summon-conjur ./tf.sh plan -destroy -out=tfdestroyplan.out

> summon -p summon-conjur ./tf.sh destroy -auto-approve 
```

# Outputs

**Output Name**|**Description**
-----|-----
**public_url**  | Public dns for ec2


Authors
=======
Originally created by [Andres Guisado](https://www.linkedin.com/in/andresguisado/)



