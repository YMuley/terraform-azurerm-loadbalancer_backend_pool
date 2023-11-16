locals {
  lb_pool = {for pool in var.backend_pool_list : format("%s/%s",pool.loadbalancer_name,pool.name)  => pool}
}