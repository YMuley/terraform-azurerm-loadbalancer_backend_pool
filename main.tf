resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  for_each = local.lb_pool
  name = each.value.name
  loadbalancer_id = var.load_balancer_output[each.value.loadbalancer_name].id
  virtual_network_id = var.virtual_network_output[each.value.virtual_network_name].id
  dynamic "tunnel_interface" {
    for_each =  each.value.tunnel_interface  #length(each.value.tunnel_interface ) == 0 ? [] : each.value.tunnel_interface
    content {
      identifier = try(tunnel_interface.value.identifier,null)
      type       = try(tunnel_interface.value.type , null)
      protocol   = try(tunnel_interface.value.protocol, null)
      port       = try(tunnel_interface.value.port,null)
    }
  }
}
