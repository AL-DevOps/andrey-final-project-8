variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "AMIS" {
  type = map(string)
  default = {

    eu-central-1 = "ami-0caef02b518350c8b"
  }
}
