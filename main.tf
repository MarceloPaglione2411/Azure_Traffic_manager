module "rg_module" {
  source = "./resource_group"
  rg_name = var.rg_name
  rg_location = var.rg_location
}


module "traffice_manager_module" {
  source = "./traffic_manager"
  rg_name = module.rg_module.rg_name_marcelo
  rg_location = module.rg_module.location
  service_plan_name = var.service_plan_name
  service_plan_name2 = var.service_plan_name2
  service_plan_location1 = var.service_plan_location1
  service_plan_location2 = var.service_plan_location2
  win_web_app = var.win_web_app
  win_web_app2 = var.win_web_app2
  traffic_manager_name = var.traffic_manager_name
  relative_name = var.relative_name
  endpoint_name = var.endpoint_name
  endpoint_name2 = var.endpoint_name2
  
}

module "vm-win1" {
  source = "./vm1"
  rg_name = module.rg_module.rg_name_marcelo
  rg_location = module.rg_module.location
  vnet_name = var.vnet_name
  snet_name = var.snet_name
  vm1_name = var.vm1_name
  nic_name = var.nic_name
  ip_vm1 = var.ip_vm1
}