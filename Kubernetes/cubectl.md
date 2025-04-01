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
| **`kubectl get pod wordpress`** | Get details of the `wordpress` pod |
| **`kubectl get pod wordpress \| less`** | View the `wordpress` pod details with paging |
| **`kubectl exec -it mealie-799f5c9d55-tqjbp -- bash`** | Connect to the `mealie` pod |
| **`kubectl describe pod wordpress`** | Show detailed information about the `wordpress` pod |
| **`kubectl edit pod wordpress`** | Edit the `wordpress` pod |
| **`kubectl run hazelcast --image=hazelcast/hazelcast --port=5701`** | Run the `hazelcast` pod |
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
| **`kubectl delete deployments.apps web`** | Delete the `web` deployment |
| **`kubectl apply -f wordpress-deploy.yaml`** | Apply a deployment from `wordpress-deploy.yaml` |
| **`kubectl get replicaset`** | Get the list of ReplicaSets |
| **`kubectl describe replicaset wordpress-group-75cfdc8d8d`** | Describe a specific ReplicaSet |

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
| **`kubectl config set-context --current --namespace=mealie`** | Set the default namespace to `mealie` |

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
| **`kubectl logs <pod_name>`** | Get pod logs |
| **`kubectl logs <pod_name> -c <container_name>`** | Get pod logs of a cpecific container |

## 💾 **Volumes and Storage**
| Command | Description |
|---------|-------------|
| **`k get persistentvolumes`** | Show detailed information about a persistent volumes `PV` |
| **`k get persistentvolumeclaims`** | Show information about persistent volume claims `PVC` |




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