# [terraform-azurerm-servicebusqueue][1]

Manages a ServiceBus Queue.

## Getting Started

- Format and validate Terraform code before commit.

```shell
terraform init -upgrade \
    && terraform init -reconfigure -upgrade \
    && terraform fmt -recursive . \
    && terraform fmt -check \
    && terraform validate .
```

- Always fetch latest changes from upstream and rebase from it. Terraform documentation will always be updated with GitHub Actions. See also [.github/workflows/terraform.yml](.github/workflows/terraform.yml) GitHub Actions workflow.

```shell
git fetch --all --tags --prune --prune-tags \
  && git pull --rebase --all --prune --tags
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.14.0, < 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.28.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_servicebus_queue.servicebus_queue](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | (Required) Name of the application. | `string` | n/a | yes |
| <a name="input_auto_delete_on_idle"></a> [auto\_delete\_on\_idle](#input\_auto\_delete\_on\_idle) | (Optional) The ISO 8601 timespan duration of the idle interval after which the Queue is automatically deleted, minimum of 5 minutes. | `string` | `null` | no |
| <a name="input_batched_operations_enabled"></a> [batched\_operations\_enabled](#input\_batched\_operations\_enabled) | (Optional) Boolean flag which controls whether server-side batched operations are enabled. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_dead_lettering_on_message_expiration"></a> [dead\_lettering\_on\_message\_expiration](#input\_dead\_lettering\_on\_message\_expiration) | (Optional) Boolean flag which controls whether the Queue has dead letter support when a message expires. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_default_message_ttl"></a> [default\_message\_ttl](#input\_default\_message\_ttl) | (Optional) The ISO 8601 timespan duration of the TTL of messages sent to this queue. This is the default value used when TTL is not set on message itself. | `string` | `null` | no |
| <a name="input_duplicate_detection_history_time_window"></a> [duplicate\_detection\_history\_time\_window](#input\_duplicate\_detection\_history\_time\_window) | (Optional) The ISO 8601 timespan duration during which duplicates can be detected. Defaults to 10 minutes (`PT10M`). | `string` | `"PT10M"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) The name of the environment. | `string` | n/a | yes |
| <a name="input_express_enabled"></a> [express\_enabled](#input\_express\_enabled) | (Optional) Boolean flag which controls whether Express Entities are enabled. An express queue holds a message in memory temporarily before writing it to persistent storage. Defaults to `false` for Basic and Standard. For Premium, it MUST be set to `false`. ~> **NOTE:** Service Bus Premium namespaces do not support Express Entities, so `express_enabled` MUST be set to `false`. | `bool` | `null` | no |
| <a name="input_forward_dead_lettered_messages_to"></a> [forward\_dead\_lettered\_messages\_to](#input\_forward\_dead\_lettered\_messages\_to) | (Optional) The name of a Queue or Topic to automatically forward dead lettered messages to. | `string` | `null` | no |
| <a name="input_forward_to"></a> [forward\_to](#input\_forward\_to) | (Optional) The name of a Queue or Topic to automatically forward messages to. Please [see the documentation](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-auto-forwarding) for more information. | `string` | `null` | no |
| <a name="input_lock_duration"></a> [lock\_duration](#input\_lock\_duration) | (Optional) The ISO 8601 timespan duration of a peek-lock; that is, the amount of time that the message is locked for other receivers. Maximum value is 5 minutes. Defaults to 1 minute (`PT1M`). | `string` | `"PT1M"` | no |
| <a name="input_max_delivery_count"></a> [max\_delivery\_count](#input\_max\_delivery\_count) | (Optional) Integer value which controls when a message is automatically dead lettered. Defaults to `10`. | `number` | `10` | no |
| <a name="input_max_message_size_in_kilobytes"></a> [max\_message\_size\_in\_kilobytes](#input\_max\_message\_size\_in\_kilobytes) | (Optional) Integer value which controls the maximum size of a message allowed on the queue for Premium SKU. For supported values see the "Large messages support" section of [this document](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-premium-messaging#large-messages-support-preview). | `number` | `null` | no |
| <a name="input_max_size_in_megabytes"></a> [max\_size\_in\_megabytes](#input\_max\_size\_in\_megabytes) | (Optional) Integer value which controls the size of memory allocated for the queue. For supported values see the "Queue or topic size" section of [Service Bus Quotas](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-quotas). Defaults to `1024`. | `number` | `1024` | no |
| <a name="input_namespace_id"></a> [namespace\_id](#input\_namespace\_id) | (Required) The ID of the ServiceBus Namespace to create this queue in. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_override_name"></a> [override\_name](#input\_override\_name) | (Optional) Override the name of the resource. Under normal circumstances, it should not be used. | `string` | `null` | no |
| <a name="input_partitioning_enabled"></a> [partitioning\_enabled](#input\_partitioning\_enabled) | (Optional) Boolean flag which controls whether to enable the queue to be partitioned across multiple message brokers. Changing this forces a new resource to be created. Defaults to `false` for Basic and Standard. -> **NOTE:** Partitioning is available at entity creation for all queues and topics in Basic or Standard SKUs. It is not available for the Premium messaging SKU, but any previously existing partitioned entities in Premium namespaces continue to work as expected. Please [see the documentation](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-partitioning) for more information. | `bool` | `null` | no |
| <a name="input_requires_duplicate_detection"></a> [requires\_duplicate\_detection](#input\_requires\_duplicate\_detection) | (Optional) Boolean flag which controls whether the Queue requires duplicate detection. Changing this forces a new resource to be created. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_requires_session"></a> [requires\_session](#input\_requires\_session) | (Optional) Boolean flag which controls whether the Queue requires sessions. This will allow ordered handling of unbounded sequences of related messages. With sessions enabled a queue can guarantee first-in-first-out delivery of messages. Changing this forces a new resource to be created. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_status"></a> [status](#input\_status) | (Optional) The status of the Queue. Possible values are `Active`, `Creating`, `Deleting`, `Disabled`, `ReceiveDisabled`, `Renaming`, `SendDisabled`, `Unknown`. Note that `Restoring` is not accepted. Defaults to `Active`. | `string` | `"Active"` | no |
| <a name="input_system_short_name"></a> [system\_short\_name](#input\_system\_short\_name) | (Required) The short system name. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_servicebus_queue"></a> [azurerm\_servicebus\_queue](#output\_azurerm\_servicebus\_queue) | The created Azure Service Bus Queue. |
<!-- END_TF_DOCS -->

[1]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue