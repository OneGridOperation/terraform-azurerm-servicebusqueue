variable "environment" {
  description = "(Required) The name of the environment."
  type        = string
  validation {
    condition = contains([
      "dev",
      "test",
      "prod",
    ], var.environment)
    error_message = "Possible values are dev, test, and prod."
  }
}

variable "system_short_name" {
  description = "(Required) The short system name. Changing this forces a new resource to be created."
  type        = string
}

variable "app_name" {
  description = "(Required) Name of the application."
  type        = string
}

variable "override_name" {
  description = "(Optional) Override the name of the resource. Under normal circumstances, it should not be used."
  default     = null
  type        = string
}

variable "namespace_id" {
  description = "(Required) The ID of the ServiceBus Namespace to create this queue in. Changing this forces a new resource to be created."
  type        = string
}

variable "lock_duration" {
  description = "(Optional) The ISO 8601 timespan duration of a peek-lock; that is, the amount of time that the message is locked for other receivers. Maximum value is 5 minutes. Defaults to 1 minute (`PT1M`)."
  type        = string
  default     = "PT1M"
}

variable "max_message_size_in_kilobytes" {
  description = "(Optional) Integer value which controls the maximum size of a message allowed on the queue for Premium SKU. For supported values see the \"Large messages support\" section of [this document](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-premium-messaging#large-messages-support-preview)."
  type        = number
  default     = null
}

variable "max_size_in_megabytes" {
  description = "(Optional) Integer value which controls the size of memory allocated for the queue. For supported values see the \"Queue or topic size\" section of [Service Bus Quotas](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-quotas). Defaults to `1024`."
  type        = number
  default     = 1024
}

variable "requires_duplicate_detection" {
  description = "(Optional) Boolean flag which controls whether the Queue requires duplicate detection. Changing this forces a new resource to be created. Defaults to `false`."
  type        = bool
  default     = false
}

variable "requires_session" {
  description = "(Optional) Boolean flag which controls whether the Queue requires sessions. This will allow ordered handling of unbounded sequences of related messages. With sessions enabled a queue can guarantee first-in-first-out delivery of messages. Changing this forces a new resource to be created. Defaults to `false`."
  type        = bool
  default     = false
}

variable "default_message_ttl" {
  description = "(Optional) The ISO 8601 timespan duration of the TTL of messages sent to this queue. This is the default value used when TTL is not set on message itself."
  type        = string
  default     = null
}

variable "dead_lettering_on_message_expiration" {
  description = "(Optional) Boolean flag which controls whether the Queue has dead letter support when a message expires. Defaults to `false`."
  type        = bool
  default     = false
}

variable "duplicate_detection_history_time_window" {
  description = "(Optional) The ISO 8601 timespan duration during which duplicates can be detected. Defaults to 10 minutes (`PT10M`)."
  type        = string
  default     = "PT10M"
}

variable "max_delivery_count" {
  description = "(Optional) Integer value which controls when a message is automatically dead lettered. Defaults to `10`."
  type        = number
  default     = 10
}

variable "status" {
  description = "(Optional) The status of the Queue. Possible values are `Active`, `Creating`, `Deleting`, `Disabled`, `ReceiveDisabled`, `Renaming`, `SendDisabled`, `Unknown`. Note that `Restoring` is not accepted. Defaults to `Active`."
  type        = string
  default     = "Active"
}

variable "batched_operations_enabled" {
  description = "(Optional) Boolean flag which controls whether server-side batched operations are enabled. Defaults to `true`."
  type        = bool
  default     = true
}

variable "auto_delete_on_idle" {
  description = "(Optional) The ISO 8601 timespan duration of the idle interval after which the Queue is automatically deleted, minimum of 5 minutes."
  type        = string
  default     = null
}

variable "partitioning_enabled" {
  description = "(Optional) Boolean flag which controls whether to enable the queue to be partitioned across multiple message brokers. Changing this forces a new resource to be created. Defaults to `false` for Basic and Standard. -> **NOTE:** Partitioning is available at entity creation for all queues and topics in Basic or Standard SKUs. It is not available for the Premium messaging SKU, but any previously existing partitioned entities in Premium namespaces continue to work as expected. Please [see the documentation](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-partitioning) for more information."
  type        = bool
  default     = null
}

variable "express_enabled" {
  description = "(Optional) Boolean flag which controls whether Express Entities are enabled. An express queue holds a message in memory temporarily before writing it to persistent storage. Defaults to `false` for Basic and Standard. For Premium, it MUST be set to `false`. ~> **NOTE:** Service Bus Premium namespaces do not support Express Entities, so `express_enabled` MUST be set to `false`."
  type        = bool
  default     = null
}

variable "forward_to" {
  description = "(Optional) The name of a Queue or Topic to automatically forward messages to. Please [see the documentation](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-auto-forwarding) for more information."
  type        = string
  default     = null
}

variable "forward_dead_lettered_messages_to" {
  description = "(Optional) The name of a Queue or Topic to automatically forward dead lettered messages to."
  type        = string
  default     = null
}
