# Static Pods in Kubernetes: Cheat Sheet

**What?**
* Pods directly managed by `kubelet` on a specific node (not the control plane).
* Defined in **local manifest files** (`.yaml`, `.json`) or **within a kubeconfig file** passed to `kubelet` service config using `--config`.

**Where are Manifests?**
* **Manifest Files:** Typically in a directory configured in `kubelet.config.k8s.io`. Common paths: `/etc/kubernetes/manifests/`, 😵‍💫🌈`/var/lib/kubelet/config/manifests/`.
* **Kubeconfig:** Specified by the `--config` flag when starting the `kubelet`. The pod definitions reside within the `clusters`, `users`, and `contexts` sections.

**How to Check?**
* **Manifest Files (On Node):**
    * `ls /etc/kubernetes/manifests/` (or configured path) - View manifest files.
    * `cat /etc/kubernetes/manifests/mypod.yaml` - Inspect a manifest.
* **Kubeconfig (On Node):**
    * `cat <path-to-kubeconfig>` - Inspect the kubeconfig file for pod definitions.
* **Via `kubectl`:**
    * `kubectl get pods -n kube-system -o wide` - Look for node name.
    * `kubectl describe pod <static-pod-name> -n kube-system` - Get details.

**How to Identify?**
* **`kubectl get pods`:** Often have node hostname appended (e.g., `etcd-my-node`).
* **`kubectl describe pod <pod-name>`:** `Source: file` (for manifest-based) or potentially internal `kubelet` source (for kubeconfig-based, might not be as explicit).
* **Manifest Files:** Presence of pod definition files in `kubelet`'s manifest directory.
* **Kubeconfig:** Pod definitions found within the kubeconfig file specified by `--config`.

**Lifecycle:**
* `kubelet` starts, restarts, stops based on local manifests or the configured kubeconfig.
* Control plane has limited awareness; direct control via Kubernetes objects (Deployments, etc.) is **not possible**.
* Updates require modifying the manifest file **or the kubeconfig file** on the node and restarting the `kubelet` (or it might reconcile depending on the configuration).

**Key Differences (vs. Managed Pods):**

| Feature          | Static Pods                     | Managed Pods                        |
|-----------------|---------------------------------|-------------------------------------|
| **Management** | `kubelet` (local node)          | Kubernetes Control Plane          |
| **Definition** | Local manifest files **or kubeconfig** | Kubernetes API objects            |
| **Control** | Modify local files/kubeconfig   | `kubectl` and Kubernetes APIs     |
| **Failure** | `kubelet` restarts            | Re-scheduled by control plane     |

**Use Cases:**
* Bootstrapping critical control plane components.
* Running node-specific agents.
* Defining initial pods via a standard Kubernetes configuration file.

Thanks for catching that important detail! It provides a more complete picture of how static pods can be configured.