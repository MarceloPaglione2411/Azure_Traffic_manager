output "service_plan_name" {
    value = azurerm_service_plan.mod_service_plan.name
}

output "service_plan_location1" {
  value = azurerm_service_plan.mod_service_plan.location
}

output "service_plan_name2" {
    value = azurerm_service_plan.mod_service_plan2.name
}

output "service_plan_location2" {
  value = azurerm_service_plan.mod_service_plan2.location
}

output "service_plan_id" {
  value = azurerm_service_plan.mod_service_plan.id
}

output "service_plan_id2" {
  value = azurerm_service_plan.mod_service_plan2.id
}

output "relative_name" {
  value = var.relative_name
}