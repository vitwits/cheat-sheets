# 📘 Kubernetes CNI (Container Network Interface)

## 🧠 What is CNI?

**CNI (Container Network Interface)** is a specification developed by the [CNI project](https://github.com/containernetworking/cni) under the CNCF. It defines how network interfaces should be configured for containers and how to clean them up when containers are removed.

CNI is **not a network plugin itself**, but a **standard interface** for plugins that handle networking for containers.

---

## 🔧 What are CNI Plugins?

CNI plugins are executables that implement the CNI specification and provide networking capabilities to containers in Kubernetes (and other orchestrators).

There are different types of plugins:

- **Main Plugins** (e.g., Calico, Cilium, Flannel) — provide full networking functionality.
- **Chained Plugins** — used in combination for more advanced setups (e.g., bandwidth shaping, port mapping).
- **Meta Plugins** — aggregate other plugins for complex behavior.

---

## 📍 Where Are They Used?

In Kubernetes, CNI plugins are invoked when:

- A new Pod is created
- The Kubelet requests network setup via the container runtime (like `containerd` or `CRI-O`)
- The CNI plugin configures the Pod's network namespace and attaches it to the desired network

---

## 📁 File Locations and Structure

- **Plugin binaries**: usually stored in `/opt/cni/bin/`
- **Configuration files**: located in `/etc/cni/net.d/`
- **State files (optional)**: stored in `/var/lib/cni/` or similar

### Example config file (`/etc/cni/net.d/10-calico.conflist`):
```json
{
  "cniVersion": "1.0.0",
  "name": "k8s-pod-network",
  "plugins": [
    {
      "type": "calico",
      "log_level": "info",
      "datastore_type": "kubernetes",
      ...
    }
  ]
}
