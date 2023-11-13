resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  for_each = local.lb_pool
  name = each.value.name
  loadbalancer_id = var.load_balancer_output[each.value.loadbalancer_name].id
  virtual_network_id = var.virtual_network_output[each.value.virtual_network_name].id
  dynamic "tunnel_interface" {
    for_each = length(each.value.tunnel_interface) == 0 ? [1] : []
    content {
      identifier = each.value.identifier
      type       = each.value.type
      protocol   = each.value.protocol
      port       = each.value.port
    }
  }
}