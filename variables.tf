variable "client_name" {
    default = "andres"
    type    = string
}

variable "product" {
    default = "conjur"
    type    = string
}

variable "environment" {
    default = "demo"
    type    = string
}

variable "region" {
    default = "eu-west-2"
    type    = string
}

variable "instance_type" {
    default = "t2.large"
    type    = string
}

variable "subnet" {
    default = "10.0.2.0/24"
    type    = string
}

variable "ssh_key_name" {
    default = "changeme"
    type    = string
}


variable r53_zoneid_public {
    default = "changeme"
    type    = string
}

variable dns_public_name {
    default = "changeme"
    type    = string
}
