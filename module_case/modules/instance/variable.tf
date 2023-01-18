variable "instance_name" {
  type        = string
  description = "the name of the variable"
  #when we have updates
  default = "instance"
}

variable "instance_type" {
  type        = string
  description = "the size of the compute"

}

variable "network_name" {
  type        = string
  description = "network name"

}
