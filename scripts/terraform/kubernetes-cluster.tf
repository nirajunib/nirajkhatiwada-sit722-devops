resource "azurerm_kubernetes_cluster" "sit722part5aks" {
  name                = var.app_name
  location            = var.location
  resource_group_name = azurerm_resource_group.sit722.name
  dns_prefix          = var.app_name
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.sit722part5aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.sit722part5acr.id
  skip_service_principal_aad_check = true
}