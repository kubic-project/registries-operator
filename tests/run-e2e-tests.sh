#! /bin/bash

# E2E test for k8s operator

## -- Design -- 
# this script is run on circleci regularly but you can run it locally also

# assumputions:

# 0) you have already golang and gopath installed etc.


## -- CODE --
export KUBECONFIG=~/.kube/config

# debug infos
echo "== docker version =="
docker version
echo 
echo "== kind version =="
kind version
echo

echo "== OS infos =="
cat /etc/os-release
echo "filesystems"
df -Th
echo "== END DEBUG infos =="
echo 


# copy kind config to std kubectl path
cp `kind get kubeconfig-path --name="1"` ~/.kube/config
echo "-- cluster info --"
kubectl cluster-info -v5
kubectl config view
echo 

# deploy registry operator
kubectl apply -f deployments/registries-operator-full.yaml
