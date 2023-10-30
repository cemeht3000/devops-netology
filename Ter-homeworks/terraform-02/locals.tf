locals {
  instance = "netology-develop-platform"
  v_web = "web"
  v_db  = "db"
  vm_web_instance_name = "${local.instance}-${local.v_web}"
  vm_db_instance_name = "${local.instance}-${local.v_db}"
}