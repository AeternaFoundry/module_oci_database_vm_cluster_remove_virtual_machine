variable "database_vm_cluster_remove_virtual_machines" {
  description = <<EOT
Map of database_vm_cluster_remove_virtual_machines, attributes below
Required:
    - vm_cluster_id
    - db_servers (block):
        - db_server_id (required)
Optional:
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    vm_cluster_id = string
    db_servers = list(object({
      db_server_id = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.database_vm_cluster_remove_virtual_machines : (
        length(v.db_servers) >= 1
      )
    ])
    error_message = "Each db_servers list must contain at least 1 items"
  }
}

