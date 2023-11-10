locals {
  lb_pool = {for pool in var.backend_pool_list : pool.name => pool}
}