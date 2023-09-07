resource "rhcs_machine_pool" "machine_pool" {
  cluster                 = rhcs_cluster_rosa_classic.rosa.id
  name                    = "nvidia-gpu-pool"
  machine_type            = var.machine_type
  replicas                = var.machineset_replicas
  multi_availability_zone = var.multi_availability_zone_machinepool
  use_spot_instances      = var.spot_instances_machinepool
}
