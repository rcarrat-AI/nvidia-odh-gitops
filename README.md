# Deploy OpenDataHub, Nvidia GPU Operator and Node Feature Discovery using GitOps!

Repository for provision OpenDataHub, Nvidia GPU Operator and Node Feature Discovery using GitOps

![Nvidia GPU GitOps](./docs/nvidia-gpu-gitops.png)

# Install OpenShift GitOps

```sh
oc apply -k https://github.com/redhat-cop/gitops-catalog/openshift-gitops-operator/operator/overlays/latest
```

## Install all using OpenShift GitOps

```sh
oc apply -k deploy/
```

## Check the OpenShift GitOps status

```sh
echo "https://$(oc get route -n openshift-gitops openshift-gitops-server -o jsonpath='{.spec.host}')"
```