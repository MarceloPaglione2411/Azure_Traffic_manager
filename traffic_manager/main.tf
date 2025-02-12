resource "azurerm_service_plan" "mod_service_plan" {
  name                = var.service_plan_name
  resource_group_name = var.rg_name
  location            = var.service_plan_location1
  os_type             = "Windows"
  sku_name            = "S1"
  
}

resource "azurerm_service_plan" "mod_service_plan2" {
  name                = var.service_plan_name2
  resource_group_name = var.rg_name
  location            = var.service_plan_location2
  os_type             = "Windows"
  sku_name            = "S1"

}

resource "azurerm_windows_web_app" "mod_win_web_app" {
  name                = var.win_web_app
  resource_group_name = var.rg_name
  location            = var.service_plan_location1
  service_plan_id     = azurerm_service_plan.mod_service_plan.id

  site_config {}
}

resource "azurerm_windows_web_app" "mod_win_web_app2" {
  name                = var.win_web_app2
  resource_group_name = var.rg_name
  location            = var.service_plan_location2
  service_plan_id     = azurerm_service_plan.mod_service_plan2.id

  site_config {}
}

resource "random_id" "server" {
  keepers = {
    azi_id = 1
  }

  byte_length = 8
}

resource "azurerm_traffic_manager_profile" "mod_traffic_manager_profile" {
  name                   = var.traffic_manager_name
  resource_group_name    = var.rg_name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = var.relative_name
    ttl           = 60
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "mod_azure_endpoint1" {
  name                 = var.endpoint_name
  profile_id           = azurerm_traffic_manager_profile.mod_traffic_manager_profile.id
  always_serve_enabled = true
  weight               = 100
  target_resource_id   = azurerm_windows_web_app.mod_win_web_app.id
}

resource "azurerm_traffic_manager_azure_endpoint" "mod_azure_endpoint2" {
  name                 = var.endpoint_name2
  profile_id           = azurerm_traffic_manager_profile.mod_traffic_manager_profile.id
  always_serve_enabled = true
  weight               = 130
  target_resource_id =  azurerm_windows_web_app.mod_win_web_app2.id
}


