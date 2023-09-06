resource "rhcs_machine_pool" "machine_pool" {
  cluster                 = rhcs_cluster_rosa_classic.rosa.id
  name                    = "nvidia-gpu-pool"
  machine_type            = var.machine_type
  # use_spot_instances      = true
  # multi_availability_zone = false
}
