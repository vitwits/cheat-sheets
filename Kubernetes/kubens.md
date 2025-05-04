## kubens: Quick Guide for Linux

**kubens** is a command-line tool that simplifies switching between Kubernetes namespaces within a selected context (cluster). It complements `kubectx` for a smoother Kubernetes management experience. This guide focuses on installation and basic usage on Linux.

**Installation on Linux:**

Here are several ways to install `kubens` on Linux:

1.  **Using Krew (kubectl plugin manager - Recommended):**
    * Ensure you have Krew installed. Follow the official Krew installation guide if you haven't: [https://krew.sigs.k8s.io/docs/user-guide/setup/](https://krew.sigs.k8s.io/docs/user-guide/setup/)
    * Once Krew is installed, you can install `kubens`:
      ```bash
      kubectl krew install ns
      ```
    * After installation, `kubens` will be available as `kubectl ns`.

2.  **Downloading Pre-built Binaries:**
    * Go to the kubectx GitHub releases page: [https://github.com/ahmetb/kubectx/releases](https://github.com/ahmetb/kubectx/releases) (Note: `kubens` is in the same repository).
    * Download the appropriate binary for your Linux architecture (usually `kubens_linux_amd64`).
    * Make the downloaded binary executable:
      ```bash
      chmod +x kubens_linux_amd64
      ```
    * Move the binary to a directory in your system's PATH (e.g., `/usr/local/bin/` or `~/bin/`):
      ```bash
      sudo mv kubens_linux_amd64 /usr/local/bin/kubens
      # OR
      mkdir -p ~/bin && mv kubens_linux_amd64 ~/bin/kubens && export PATH="$HOME/bin:$PATH"
      ```

3.  **Cloning the Repository and Creating a Symbolic Link:**
    * Clone the `kubectx` repository to `/opt` (it contains both `kubectx` and `kubens`):
      ```bash
      sudo git clone [https://github.com/ahmetb/kubectx](https://github.com/ahmetb/kubectx) /opt/kubectx
      ```
    * Create a symbolic link to make `kubens` accessible from your PATH:
      ```bash
      sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
      ```
      

**Basic Usage:**

1.  **List Available Namespaces:** To see a list of namespaces in the currently active Kubernetes context, run:
    ```bash
    kubens
    # OR (if installed via Krew)
    kubectl ns
    ```
    The currently active namespace will be highlighted.

2.  **Switch Namespace:** To change to a different namespace within the current context:
    ```bash
    kubens <namespace_name>
    # OR (if installed via Krew)
    kubectl ns <namespace_name>
    ```
    Replace `<namespace_name>` with the name of the target namespace from the list.

3.  **Switch Back to Previous Namespace:** Quickly return to the last active namespace:
    ```bash
    kubens -
    # OR (if installed via Krew)
    kubectl ns -
    ```

**Integration with `kubectl`:**

`kubens` directly modifies the namespace setting in your current `kubectl` context. After switching namespaces with `kubens`, all subsequent `kubectl` commands will automatically target the selected namespace. You no longer need to repeatedly use the `-n <namespace>` flag.

**Example Workflow:**

1.  You are currently working in the `default` namespace.
2.  You need to inspect resources in the `kube-system` namespace.
3.  Run `kubens kube-system`.
4.  Now, `kubectl get pods` will automatically list pods in the `kube-system` namespace.
5.  To go back to the `default` namespace, run `kubens default` or `kubens -`.

**Key Benefits on Linux:**

* **Simplified Namespace Switching:** Easily manage namespaces within your active Kubernetes cluster from your Linux terminal.
* **Improved Workflow:** Reduces the need to repeatedly type the `-n` flag for `kubectl` commands.
* **Clear Namespace Awareness:** The highlighting of the current namespace helps avoid operating in the wrong namespace.
* **Complements `kubectx`:** Use `kubectx` to switch between clusters and `kubens` to switch between namespaces within those clusters for efficient multi-environment management.

By using `kubens` on Linux, you can significantly streamline your interactions with different namespaces in your Kubernetes clusters.