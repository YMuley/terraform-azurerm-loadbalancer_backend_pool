variable "backend_pool_list" {
  type = list(any)
  default = []
  description = "lb backebdpool list"
}

variable "load_balancer_output" {
  type = map(any)
  default = { }
  description = "load balancer object output"
}

# variable "virtual_network_output" {
#   type        = map(any)
#   default     = {}
#   description = "list of virtual network objects "
# }