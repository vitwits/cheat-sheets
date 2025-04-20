# 🐳 Kubectl Cheatsheet

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

## 📦 **Deployment & Scaling**
| Command | Description |
|---------|-------------|
| **`kubectl create deployment my-dep --image=nginx --replicas=3`** | Create a deployment with 3 replicas |
| **`kubectl create -f replicaset-definition.yaml`** | Create a new replica set |
| **`kubectl replace -f replicaset-definition.yaml`** | Apply new replica set definition |
| **`kubectl scale --replicas=6 -f replicaset-definition.yaml`** | Apply new replica set definition |
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


## 🔐 **Secrets**
| Command | Description |
|---------|-------------|
| **`kubectl get secrets`** | Show all secrets in the current namespace |
| **`kubectl describe secret <name>`** | Show detailed information about a specific secret |
| **`kubectl create secret generic <name> --from-literal=key=value`** | Create a secret from a key-value pair |
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