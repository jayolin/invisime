variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
  sensitive = true  # Mark this as sensitive so it's not printed in the output
}

variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}