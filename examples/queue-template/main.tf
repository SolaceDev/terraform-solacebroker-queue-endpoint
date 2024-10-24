# Copyright 2024 Solace Corporation. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "queue_template" {
  # update with the module location
  source = "../.."

  msg_vpn_name  = "default"
  endpoint_type = "queue_template"
  endpoint_name = "testQT"

  # permission "consume" enables a messaging client to connect, read and consume messages to/from the queue
  # that has been created from the template
  permission = "consume"

  # example optional config for the queue template
  respect_ttl_enabled = true
}

output "provisioned_queue_template" {
  value       = module.queue_template.queue_template
  description = "The provisioned queue template resource"
}

