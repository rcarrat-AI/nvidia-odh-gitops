

```md
export CLUSTER_NAME="poc-tbd-nvidia" 
export AWS_REGION="us-east-2"
export VERSION="4.13.3"
export MACHINE_POOL_NAME=nvidia-gpu-pool
export MACHINE_POOL_REPLICA_COUNT=1
export GPU_INSTANCE_TYPE='g5.xlarge'
```

```md
rosa create account-roles --mode auto
rosa create cluster --cluster-name $CLUSTER_NAME --sts --mode auto --yes
```

I: To determine when your cluster is Ready, run 'rosa describe cluster -c poc-tbd-nvidia'.
I: To watch your cluster installation logs, run 'rosa logs install -c poc-tbd-nvidia --watch'.

```md
rosa create admin -c $CLUSTER_NAME
```

```
rosa create machinepool --cluster=$CLUSTER_NAME \
  --name=$MACHINE_POOL_NAME \
  --replicas=$MACHINE_POOL_REPLICA_COUNT \
  --instance-type=$GPU_INSTANCE_TYPE
```