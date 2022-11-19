variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "AMIS" {
  type = map(string)
  default = {

    eu-central-1 = "ami-06148e0e81e5187c8"
  }
}
