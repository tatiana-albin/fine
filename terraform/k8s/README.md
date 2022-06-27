# Learn Terraform - Provision an EKS Cluster

This repo is a companion repo to the [Provision an EKS Cluster learn guide](https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster), containing
Terraform configuration files to provision an EKS cluster on AWS.

Commands to run:

cd k8s

terraform init

terraform apply

aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

wget -O v0.3.6.tar.gz https://codeload.github.com/kubernetes-sigs/metrics-server/tar.gz/v0.3.6 && tar -xzf v0.3.6.tar.gz

kubectl apply -f metrics-server-0.3.6/deploy/1.8+/

kubectl get deployment metrics-server -n kube-system

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml

kubectl proxy

kubectl apply -f https://raw.githubusercontent.com/hashicorp/learn-terraform-provision-eks-cluster/main/kubernetes-dashboard-admin.rbac.yaml

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')

terraform destroy