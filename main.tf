resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  for_each = local.lb_pool
  name = each.value.name
  loadbalancer_id = var.load_balancer_output[each.value.loadbalancer_name].id
  virtual_network_id = var.virtual_network_output[each.value.virtual_network_name].id
  dynamic "tunnel_interface" {
    for_each =  each.value.tunnel_interface == 0 ? [] : each.value.tunnel_interface
    content {
      identifier = each.value.tunnel_interface.identifier
      type       = each.value.tunnel_interface.type
      protocol   = each.value.tunnel_interface.protocol
      port       = each.value.tunnel_interface.port
    }
  }
}