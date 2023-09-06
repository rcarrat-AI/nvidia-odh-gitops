resource "rhcs_machine_pool" "machine_pool" {
  cluster             = rhcs_cluster_rosa_classic.rosa.id
  name                = "nvidia-gpu-pool"
  machine_type        = var.machine_type
  replicas            = var.machineset_replicas
  autoscaling_enabled = var.autoscaling_enabled
}
