## Deploy ROSA cluster with GPU MachineSets

## With Terraform

* Create the auto.tfvars

```md
cat << EOF > terraform.auto.tfvars
cluster_name = "rosa-test"
replicas = "3"  # Set to 3 for HA, 2 for single-AZ
offline_access_token = "**************" # Get from https://console.redhat.com/openshift/token/rosa/show
rosa_version = "4.12.14" # Needs to be a supported version by ROSA
aws_region           = "us-east-2" # Optional, only if you're not selecting us-west-2 region
availability_zones   = ["us-east-2a", "us-east-2b", "us-east-2c"] # Optional, only if you're not selecting us-west-2 region

htpasswd_username = "kubeadmin"
htpasswd_password = "*********"
machine_type        = "g5.xlarge"
machineset_replicas = "1"
autoscaling_enabled = false
EOF
``````

* Create the rosa cluster

```md
make init
make create.public
```

* Check the cluster id and url for monitoring

```md
rosa describe cluster --cluster=$cluster_name
```

## With ROSA CLI

* Export the variables

```md
export CLUSTER_NAME="poc-tbd-nvidia" 
export AWS_REGION="us-east-2"
export VERSION="4.13.3"
export MACHINE_POOL_NAME=nvidia-gpu-pool
export MACHINE_POOL_REPLICA_COUNT=1
export GPU_INSTANCE_TYPE='g5.xlarge'
```

* Deploy the rosa cluster

```md
rosa create account-roles --mode auto
rosa create cluster --cluster-name $CLUSTER_NAME --sts --mode auto --yes
```

* Generate the cluster admin

```md
rosa create admin -c $CLUSTER_NAME
```

* Create the machine pool

```
rosa create machinepool --cluster=$CLUSTER_NAME \
  --name=$MACHINE_POOL_NAME \
  --replicas=$MACHINE_POOL_REPLICA_COUNT \
  --instance-type=$GPU_INSTANCE_TYPE
```