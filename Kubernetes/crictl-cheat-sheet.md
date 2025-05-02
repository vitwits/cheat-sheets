
# 🐳 crictl Cheat Sheet

`crictl` is a CLI tool for managing containers and pods using the Kubernetes Container Runtime Interface (CRI). It works with runtimes like `containerd` and `CRI-O`.

---

## 📦 Images

### List all images
```bash
crictl images
```

### Pull an image
```bash
crictl pull <image-name>
```

### Remove an image
```bash
crictl rmi <image-id>
```

---

## 🚀 Containers

### List all containers (running and stopped)
```bash
crictl ps -a
```

### List running containers only
```bash
crictl ps
```

### Start a container
```bash
crictl start <container-id>
```

### Stop a container
```bash
crictl stop <container-id>
```

### Remove a container
```bash
crictl rm <container-id>
```

### Inspect container details (JSON format)
```bash
crictl inspect <container-id>
```

### View container logs
```bash
crictl logs <container-id>
```

---

## 🧪 Pod Sandboxes

### List all pod sandboxes
```bash
crictl pods
```

### Run a pod sandbox from config file
```bash
crictl runp <pod-config.json>
```

### Remove a pod sandbox
```bash
crictl rmp <pod-id>
```

### Inspect a pod sandbox
```bash
crictl inspectp <pod-id>
```

---

## ⚙️ Misc

### Display runtime info
```bash
crictl info
```

### Show crictl configuration
```bash
crictl config
```

### Set runtime endpoint manually (if needed)
```bash
crictl --runtime-endpoint unix:///run/containerd/containerd.sock ps
```
