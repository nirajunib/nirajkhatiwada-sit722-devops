variable "app_name" {
  description = "Book and Inventory management application"
  type        = string
  default     = "bookstorepart5"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "australiacentral"
}

variable "kubernetes_version" {    
  description = "Kubernetes version"
  type        = string
  default     = "1.30.3"
}