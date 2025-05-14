locals {
  name = var.override_name == null ? "${var.system_short_name}-${var.app_name}-${lower(var.environment)}-sbq" : var.override_name
}

resource "azurerm_servicebus_queue" "servicebus_queue" {
  name         = local.name
  namespace_id = var.namespace_id

  lock_duration                           = var.lock_duration
  max_message_size_in_kilobytes           = var.max_message_size_in_kilobytes
  max_size_in_megabytes                   = var.max_size_in_megabytes
  requires_duplicate_detection            = var.requires_duplicate_detection
  requires_session                        = var.requires_session
  default_message_ttl                     = var.default_message_ttl
  dead_lettering_on_message_expiration    = var.dead_lettering_on_message_expiration
  duplicate_detection_history_time_window = var.duplicate_detection_history_time_window
  max_delivery_count                      = var.max_delivery_count
  status                                  = var.status
  batched_operations_enabled              = var.batched_operations_enabled
  auto_delete_on_idle                     = var.auto_delete_on_idle
  partitioning_enabled                    = var.partitioning_enabled
  express_enabled                         = var.express_enabled
  forward_to                              = var.forward_to
  forward_dead_lettered_messages_to       = var.forward_dead_lettered_messages_to
}
