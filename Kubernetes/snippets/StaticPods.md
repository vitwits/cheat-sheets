# Static Pods in Kubernetes: Cheat Sheet

**What?**
* Pods directly managed by `kubelet` on a specific node (not the control plane).
* Defined in local manifest files (`.yaml`, `.json`) on that node.

**Where are Manifests?**
* Typically in a directory configured in `kubelet.config.k8s.io`.
* Common paths: `/etc/kubernetes/manifests/`, `/var/lib/kubelet/config/manifests/`.

**How to Check?**
* **On Node:**
    * `ls /etc/kubernetes/manifests/` (or configured path) - View manifest files.
    * `cat /etc/kubernetes/manifests/mypod.yaml` - Inspect a manifest.
* **Via `kubectl`:**
    * `kubectl get pods -n kube-system -o wide` - Look for node name.
    * `kubectl describe pod <static-pod-name> -n kube-system` - Get details.

**How to Identify?**
* **`kubectl get pods`:** Often have node hostname appended (e.g., `etcd-my-node`).
* **`kubectl describe pod <pod-name>`:** `Source: file` indicates a static pod.
* **Manifest Files:** Presence of pod definition files in `kubelet`'s manifest directory.

**Lifecycle:**
* `kubelet` starts, restarts, stops based on local manifests.
* Control plane has limited awareness; direct control via Kubernetes objects (Deployments, etc.) is **not possible**.
* Updates require modifying the manifest file on the node.

**Key Differences (vs. Managed Pods):**

| Feature          | Static Pods                     | Managed Pods                        |
|-----------------|---------------------------------|-------------------------------------|
| **Management** | `kubelet` (local node)          | Kubernetes Control Plane          |
| **Definition** | Local manifest files          | Kubernetes API objects            |
| **Control** | Modify local files            | `kubectl` and Kubernetes APIs     |
| **Failure** | `kubelet` restarts            | Re-scheduled by control plane     |

**Use Cases:**
* Bootstrapping critical control plane components.
* Running node-specific agents.