resource "oci_database_vm_cluster_remove_virtual_machine" "database_vm_cluster_remove_virtual_machines" {
  for_each = var.database_vm_cluster_remove_virtual_machines

  vm_cluster_id = each.value.vm_cluster_id

  dynamic "db_servers" {
    for_each = each.value.db_servers
    content {
      db_server_id = db_servers.value.db_server_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

