resource "solacebroker_msg_vpn_queue" "main" {
  count = var.endpoint_type == "queue" ? 1 : 0

  msg_vpn_name    = var.msg_vpn_name
  queue_name      = var.endpoint_name
  ingress_enabled = true
  egress_enabled  = true
  max_msg_size    = var.max_msg_size
}

resource "solacebroker_msg_vpn_queue_subscription" "main" {
  count = var.endpoint_type == "queue" ? length(var.queue_subscription_topics) : 0

  msg_vpn_name       = solacebroker_msg_vpn_queue.main[0].msg_vpn_name
  queue_name         = solacebroker_msg_vpn_queue.main[0].queue_name
  subscription_topic = var.queue_subscription_topics[count.index]
}

resource "solacebroker_msg_vpn_jndi_queue" "main" {
  count = var.endpoint_type == "queue" && var.jndi_queue_name != "" ? 1 : 0

  msg_vpn_name       = solacebroker_msg_vpn_queue.main[0].msg_vpn_name
  physical_name      = solacebroker_msg_vpn_queue.main[0].queue_name
  queue_name         = var.jndi_queue_name
}

resource "solacebroker_msg_vpn_topic_endpoint" "main" {
  count = var.endpoint_type == "topic_endpoint" ? 1 : 0

  msg_vpn_name    = var.msg_vpn_name
  topic_endpoint_name      = var.endpoint_name
  ingress_enabled = true
  egress_enabled  = true
  max_msg_size    = var.max_msg_size
}

resource "solacebroker_msg_vpn_jndi_topic" "main" {
  count = var.endpoint_type == "topic_endpoint" && var.jndi_topic_name != "" ? 1 : 0

  msg_vpn_name       = solacebroker_msg_vpn_topic_endpoint.main[0].msg_vpn_name
  physical_name      = solacebroker_msg_vpn_topic_endpoint.main[0].topic_endpoint_name
  topic_name         = var.jndi_topic_name
}

resource "solacebroker_msg_vpn_queue_template" "main" {
  count = var.endpoint_type == "queue_template" ? 1 : 0

  msg_vpn_name    = var.msg_vpn_name
  queue_template_name      = var.endpoint_name
}

resource "solacebroker_msg_vpn_topic_endpoint_template" "main" {
  count = var.endpoint_type == "topic_endpoint_template" ? 1 : 0

  msg_vpn_name    = var.msg_vpn_name
  topic_endpoint_template_name      = var.endpoint_name
}
