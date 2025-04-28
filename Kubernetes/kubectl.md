# 🐳 Kubectl Cheatsheet

## 🎯 **Help and Documentation**
| Command | Description |
|---------|-------------|
| **`kubectl explain pod.spec`** | Shows detailed information about the spec field in a Pod |
| **`kubectl explain deployment.spec.replicas`** | Shows information about the replicas field within a Deployment's spec |
| **`kubectl describe -h`** | Displays help for kubectl describe |
| **`kubectl exec -h`** | Displays help for kubectl exec to understand options for running commands in a pod |
| **`kubectl explain pod`** | Explain the usage of pod or other resource ⬇️ |
<!-- Pod, Deployment, ReplicaSet, StatefulSet, DaemonSet, Job, CronJob, Service, Ingress, NetworkPolicy, PersistentVolume, PersistentVolumeClaim, StorageClass, ConfigMap, Secret, ServiceAccount, Role, RoleBinding, ClusterRole, ClusterRoleBinding, Node, Namespace, Event, LimitRange, ResourceQuota, CustomResourceDefinition (CRD), HorizontalPodAutoscaler, VerticalPodAutoscaler
 -->


## 🎯 **Context & Configuration**
| Command | Description |
|---------|-------------|
| **`kubectl config view`** | Show the kubeconfig settings |
| **`kubectl config use-context <name>`** | Switch to a different context |
| **`kubectl config get-contexts`** | List available contexts |
| **`kubectl config current-context`** | Display the current context |
| **`kubectl config set-context --current --namespace=<namespace>`** | Set the default namespace |


## 🚀 **Pod Management**
| Command | Description |
|---------|-------------|
| **`kubectl get pods`** | List all pods |
| **`kubectl get pods -o wide`** | List pods with additional details |
| **`kubectl get pods -A`** | Pods on all namespaces |
| **`kubectl get pods -n mealie`** | Pods in the `mealie` namespace |
| **`kubectl get pods --namespace mealie`** | Pods in the `mealie` namespace |
| **`kubectl get pods -l app=nginx,env=prod`** | Get pods by labels |
| **`kubectl get pod wordpress`** | Get details of the `wordpress` pod |
| **`kubectl get pod wordpress \| less`** | View the `wordpress` pod details with paging |
| **`kubectl get all -l env=prod`** | View the resources with specific label |
| **`kubectl exec -it mealie-799f5c9d55-tqjbp -- bash`** | Connect to the `mealie` pod |
| **`kubectl describe pod wordpress`** | Show detailed information about the `wordpress` pod |
| **`kubectl edit pod wordpress`** | Edit the `wordpress` pod |
| **`kubectl run hazelcast --image=hazelcast/hazelcast --port=5701`** | Run the `hazelcast` pod |
| **`kubectl run my-pod --image=nginx --labels="app=nginx,env=dev"`** | Run pod with labels |
| **`kubectl run nginx --image=nginx`** | Run the `nginx` pod |
| **`kubectl run -h \| less`** | Show `kubectl run` options |
| **`kubectl create -f nginx.yaml`** | Create a resource from `nginx.yaml` |
| **`kubectl apply -f nginx.yaml`** | Create or update a resource from `nginx.yaml` |
| **`kubectl replace --force -f webapp-pod.yaml`** | Delete existing and create a new pod |


## 📦 **Deployment & Scaling**
| Command | Description |
|---------|-------------|
| **`kubectl create deployment my-dep --image=nginx --replicas=3`** | Create a deployment with 3 replicas |
| **`kubectl create -f replicaset-definition.yaml`** | Create a new replica set |
| **`kubectl replace -f replicaset-definition.yaml`** | Apply new replica set definition |
| **`kubectl scale --replicas=6 -f replicaset-definition.yaml`** | Apply new replica set definition |
| **`kubectl scale deployment my-app --replicas=3`** | Scale existing deployment |
| **`kubectl get replicaset`** | Show replica sets |
| **`kubectl create deploy web --image=wordpress --replicas=10 --dry-run=client -o yaml > deployment.yaml`** | Create a deployment YAML for `wordpress` |
| **`kubectl get deploy -o wide`** | List deployments with additional details |
| **`kubectl edit deploy web`** | Edit the `web` deployment |
| **`kubectl describe deploy web`** | Show details of the `web` deployment |
| **`kubectl replace --force -f deployment.yaml`** | Deletes and recreates all existing resources |
| **`kubectl delete deployments.apps web`** | Delete the `web` deployment |
| **`kubectl apply -f wordpress-deploy.yaml`** | Apply a deployment from `wordpress-deploy.yaml` |
| **`kubectl get replicaset`** | Get the list of ReplicaSets |
| **`kubectl describe replicaset wordpress-group-75cfdc8d8d`** | Describe a specific ReplicaSet |
| **`kubectl set image deployment/my_deployment webapp=nginx:1.9.1`** | Set a new image for an existing deployment |


## 🚀 **Rollout**
| Command | Description |
|---------|-------------|
| **`kubectl rollout status deployment/<deployment-name>`** | Check the status of a deployment rollout |
| **`kubectl rollout history deployment/<deployment-name>`** | View the rollout history of a deployment |
| **`kubectl rollout undo deployment/<deployment-name>`** | Roll back to the previous deployment version |
| **`kubectl rollout restart deployment/<deployment-name>`** | Restart the deployment to trigger a fresh rollout |


## 🧑‍🔧 **Nodes**
| Command | Description |
|---------|-------------|
| **`kubectl taint node node01 spray=mortein:NoSchedule`** | Add taint to a node |
| **`kubectl taint nodes <node-name> special=dedicated:NoSchedule-`** | Remove a taint from a node |
| **`kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule-`** | Remove taint using only key and effect |
| **`kubectl label nodes node-1 size=Large`** | Assign a label to a node |
| **`kubectl get nodes node01 --show-labels`** | Show assigned labels to a node |


## 🧑‍🔧 **Namespaces**
| Command | Description |
|---------|-------------|
| **`kubectl get namespaces`** | List all namespaces |
| **`kubectl create namespace mealie`** | Create the `mealie` namespace |
| **`kubectl create ns mealie --dry-run=client -o yaml > namespace.yaml`** | Generate a namespace YAML for `mealie` |
| **`kubectl delete ns mealie`** | Delete the `mealie` namespace and its resources |
| **`kubectl run vit-mealie --image=nginx --namespace mealie`** | Run the `nginx` pod in the `mealie` namespace |
| **`kubectl get pods -n mealie`** | List pods in the `mealie` namespace |
| **`kubectl get pods -n default`** | List pods in the `default` namespace |
| **`kubectl get pods --all-namespaces`** | List pods all namespaces |
| **`kubectl config set-context --current --namespace=mealie`** | Set the default namespace to `mealie` |
| **`kubectl config set-context $(kubectl config current-context) --namespace=mealie`** | Set the default namespace to `mealie` |


## 🌐 **Networking**
| Command | Description |
|---------|-------------|
| **`kubectl get service`** | List services |
| **`kubectl expose deployment frontend --port 8080`** | Expose the `frontend` deployment on port 8080 |
| **`kubectl port-forward pod/<pod-name> 8080:80`** | Forward local port 8080 to port 80 on the pod |
| **`kubectl port-forward services/mealie 9000`** | Port-forward `mealie` service to local port 9000 |


## 🛠️ **Kubectl Miscellaneous**
| Command | Description |
|---------|-------------|
| **`kubectl apply -f <file>.yaml`** | Apply changes from a YAML file |
| **`kubectl apply -f /path/to/config-files`** | Create all the objects at once |
| **`kubectl delete -f <file>.yaml`** | Delete resources defined in a YAML file |
| **`kubectl explain <resource>`** | Show API documentation for a resource |
| **`kubectl version --short`** | Display Kubernetes client and server version |
| **`kubectl get all`** | List all resources in the current namespace |
| **`kubectl get all -n mealie`** | List all resources in the specific namespace |
| **`kubectl get --raw='/readyz?verbose'`** | Verify all the cluster component health statuses |
| **`kubectl cluster-info`** | Get cluster info |


## 🔍 **Debugging & Troubleshooting**
| Command | Description |
|---------|-------------|
| **`kubectl describe <resource> <name>`** | Show detailed information about a resource |
| **`kubectl get events`** | Display cluster events |
| **`kubectl top pods`** | Show resource usage of pods |
| **`kubectl top nodes`** | Show resource usage of nodes |
| **`kubectl get pods --field-selector=status.phase=Pending`** | List only pending pods |
| **`kubectl get pods --sort-by=.status.startTime`** | Sort pods by start time |
| **`kubectl logs <pod_name>`** | Get logs of the default container in a pod |
| **`kubectl logs <pod_name> -c <container_name>`** | Get logs of a specific container in a pod |
| **`kubectl logs <pod_name> -f`** | Stream (follow) logs in real-time (like `tail -f`) |
| **`kubectl logs <pod_name> --since=1h`** | Show logs from the last 1 hour |
| **`kubectl logs <pod_name> --tail=100`** | Show only the last 100 lines of logs |
| **`kubectl logs <pod_name> --previous`** | Show logs from the previously terminated container |
| **`kubectl logs -l app=myapp`** | Show logs from pods matching a label selector |


## ⚙️ **ConfigMap Commands**
| Command | Description |
|---------|-------------|
| **`kubectl create configmap my-config --from-file=app.properties`** | Create ConfigMap from a single file |
| **`kubectl create configmap my-config --from-file=./config/`** | Create ConfigMap from all files in a directory |
| **`kubectl create configmap my-config --from-literal=KEY=VALUE`** | Create ConfigMap from literal key-value pairs |
| **`kubectl get configmaps`** | List all ConfigMaps in the current namespace |
| **`kubectl describe configmap my-config`** | Show detailed information about a specific ConfigMap |
| **`kubectl delete configmap my-config`** | Delete a specific ConfigMap |
| **`kubectl apply -f configmap.yaml`** | Create or update ConfigMap from a YAML manifest |
| **`kubectl get configmap my-config -o yaml`** | Get full YAML output of a ConfigMap |


## ⚙️ **Autoscale Commands**
| Command | Description |
|---------|-------------|
| **`kubectl autoscale deployment my-deployment --cpu-percent=50 --min=1 --max=10`** | Create an autoscaler for a Deployment based on CPU usage |
| **`kubectl get hpa`** | List all Horizontal Pod Autoscalers (HPAs) in the current namespace |
| **`kubectl describe hpa my-deployment`** | Show detailed information about a specific HPA |
| **`kubectl delete hpa my-deployment`** | Delete a specific HPA |
| **`kubectl apply -f hpa.yaml`** | Create or update an HPA from a YAML manifest |
| **`kubectl get hpa my-deployment -o yaml`** | Get full YAML output of an HPA |
| **`kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://nginx; done"`** | Create load on nginx service for load testing |
| **`kubectl get hpa -w`** | Watch real time hpa stage (--watch) |


## 🔐 **Secrets**
| Command | Description |
|---------|-------------|
| **`kubectl get secrets`** | Show all secrets in the current namespace |
| **`kubectl get secrets my-secrets -o yaml`** | Show secret in yaml format |
| **`kubectl describe secret <name>`** | Show detailed information about a specific secret |
| **`kubectl create secret generic <name> --from-literal=key=value`** | Create a secret from a key-value pair |
| **`kubectl create secret generic my-secret --from-literal=username=admin --from-literal=password=SuperSecret123`** | Several pairs |
| **`kubectl create secret generic <name> --from-file=path/to/file`** | Create a secret from a file |
| **`kubectl create -f secret.yaml`** | Create a secret from a YAML file |
| **`kubectl apply -f secret.yaml`** | Create or update a secret from a YAML file |
| **`kubectl delete secret <name>`** | Delete a specific secret |
| **`kubectl edit secret <name>`** | Edit the secret using the default editor |


## 💾 **Volumes and Storage**
| Command | Description |
|---------|-------------|
| **`kubectl get persistentvolumes`** | Show detailed information about a persistent volumes `PV` |
| **`kubectl get persistentvolumeclaims`** | Show information about persistent volume claims `PVC` |


## 📊 **Metrics Server Commands**
| Command | Description |
|---------|-------------|
| **`kubectl top nodes`** | Show resource usage (CPU/Memory) for all nodes |
| **`kubectl top pods`** | Show resource usage for all pods in the current namespace |
| **`kubectl top pods -n <namespace>`** | Show pod metrics in a specific namespace |
| **`kubectl top pod <pod-name> --containers`** | Show metrics for all containers in a pod |
| **`kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml`** | Install Metrics Server from the official release |
| **`kubectl get deployment metrics-server -n kube-system`** | Check if the Metrics Server is deployed |
| **`kubectl logs -n kube-system deployment/metrics-server`** | View logs for troubleshooting |


## 🛠️ **Cluster and Node Maintenance Commands**
| Command | Description |
|---------|-------------|
| **`kubectl cordon <node-name>`** | Mark a node as unschedulable (prevent new pods) |
| **`kubectl drain <node-name> --ignore-daemonsets --delete-emptydir-data`** | Safely evict pods from a node for maintenance |
| **`kubectl uncordon <node-name>`** | Allow scheduling new pods onto the node after maintenance |
| **`kubectl delete node <node-name>`** | Remove node object from the cluster (after shutdown or replace) |
| **`kubectl describe node <node-name>`** | Detailed information about node status, conditions |
| **`kubectl get nodes -o wide`** | View all nodes and IPs for maintenance planning |
| **`kubectl rollout status daemonset/<daemonset-name> -n kube-system`** | Ensure critical DaemonSets (like CNI plugins) are running |


## 📦 **Cluster Backup and Restore**
| Command | Description |
|---------|-------------|
| **`etcdctl snapshot save <backup.db>`** | Save etcd backup manually (from master node) |
| **`etcdctl snapshot restore <backup.db>`** | Restore etcd snapshot (after disaster) |
| **`kubectl get all --all-namespaces -o yaml > full-backup.yaml`** | Export full cluster state (basic method) |
| **`kubectl apply -f full-backup.yaml`** | Re-apply full cluster backup (basic restore) |


## 🚀 **Cluster Upgrade**
| Command | Description |
|---------|-------------|
| **`kubeadm upgrade plan`** | Show available Kubernetes upgrade versions |
| **`kubeadm upgrade apply vX.Y.Z`** | Upgrade master/control plane to specific version |
| **`kubectl drain <node-name> --ignore-daemonsets`** | Prepare a worker node for upgrade |
| **`apt-get upgrade kubelet kubectl kubeadm`** | Update packages (Debian/Ubuntu) |
| **`systemctl daemon-reexec && systemctl restart kubelet`** | Restart services after upgrade |
| **`kubectl uncordon <node-name>`** | Bring worker node back after upgrade |


## 🧹 **Operating System Maintenance (Node OS Upgrade)**
| Command | Description |
|---------|-------------|
| **`kubectl cordon <node-name>`** | Prepare node for OS upgrade |
| **`kubectl drain <node-name> --ignore-daemonsets`** | Evict pods safely |
| **`apt-get update && apt-get upgrade`** | OS upgrade commands (Debian/Ubuntu) |
| **`reboot`** | Reboot the node after OS patches |
| **`kubectl uncordon <node-name>`** | Re-enable the node after successful reboot |


## 🛡️ **Pro-Tips for Safe Maintenance**
| Tip | Description |
|-----|-------------|
| **Use PodDisruptionBudgets (PDBs)** | Protect critical applications during drain |
| **Backup etcd regularly** | Always backup before upgrade |
| **Upgrade master first** | Upgrade control plane first, then workers |
| **Validate after upgrade** | Check `kubectl get nodes` and pod statuses carefully |



# 📌 Popular Abbreviations in Kubernetes

| Full Name                   |Abbreviation|
|-----------------------------|------------|
| `PersistentVolume`          | `pv`       |
| `PersistentVolumeClaim`     | `pvc`      |
| `Pod`                       | `po`       |
| `Deployment`                | `deploy`   |
| `Service`                   | `svc`      |
| `Namespace`                 | `ns`       |
| `ReplicaSet`                | `rs`       |
| `ConfigMap`                 | `cm`       |
| `Secret`                    | `secret`   |
| `Ingress`                   | `ing`      |
| `Node`                      | `no`       |
| `DaemonSet`                 | `ds`       |
| `StatefulSet`               | `sts`      |
| `Job`                       | `job`      |
| `CronJob`                   | `cj`       |
| `Event`                     | `ev`       |
| `HorizontalPodAutoscaler`   | `hpa`      |
| `PodDisruptionBudget`       | `pdb`      |
| `NetworkPolicy`             | `netpol`   |
| `StorageClass`              | `sc`       |
| `CertificateSigningRequest` | `csr`      |
| `ClusterRole`               | `cr`       |
| `ClusterRoleBinding`        | `crb`      |
| `Role`                      | `role`     |
| `RoleBinding`               | `rb`       |
| `Endpoints`                 | `ep`       |
| `ResourceQuota`             | `rq`       |
| `LimitRange`                | `lr`       |
| `PodSecurityPolicy`         | `psp`      |
| `VerticalPodAutoscaler`     | `vpa`      |
|-----------------------------|------------|