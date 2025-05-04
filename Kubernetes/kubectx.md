## kubectx: Quick Guide for Linux

**kubectx** is a command-line tool that simplifies switching between Kubernetes contexts (clusters). This guide focuses on installation and basic usage on Linux.

**Installation on Linux:**

Here are several ways to install `kubectx` on Linux:

1.  **Using Krew (kubectl plugin manager - Recommended):**
    * Ensure you have Krew installed. Follow the official Krew installation guide if you haven't: [https://krew.sigs.k8s.io/docs/user-guide/setup/](https://krew.sigs.k8s.io/docs/user-guide/setup/)
    * Once Krew is installed, you can install `kubectx`:
      ```bash
      kubectl krew install ctx
      ```
    * After installation, `kubectx` will be available as `kubectl ctx`.

2.  **Downloading Pre-built Binaries:**
    * Go to the kubectx GitHub releases page: [https://github.com/ahmetb/kubectx/releases](https://github.com/ahmetb/kubectx/releases)
    * Download the appropriate binary for your Linux architecture (usually `kubectx_linux_amd64`).
    * Make the downloaded binary executable:
      ```bash
      chmod +x kubectx_linux_amd64
      ```
    * Move the binary to a directory in your system's PATH (e.g., `/usr/local/bin/` or `~/bin/`):
      ```bash
      sudo mv kubectx_linux_amd64 /usr/local/bin/kubectx
      # OR
      mkdir -p ~/bin && mv kubectx_linux_amd64 ~/bin/kubectx && export PATH="$HOME/bin:$PATH"
      ```

3.  **Cloning the Repository and Creating a Symbolic Link:**
    * Clone the `kubectx` repository to `/opt`:
      ```bash
      sudo git clone [https://github.com/ahmetb/kubectx](https://github.com/ahmetb/kubectx) /opt/kubectx
      ```
    * Create a symbolic link to make `kubectx` accessible from your PATH:
      ```bash
      sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
      ```

**Basic Usage:**

1.  **List Available Contexts:** To see a list of your configured Kubernetes contexts, run:
    ```bash
    kubectx
    # OR (if installed via Krew)
    kubectl ctx
    ```
    The currently active context will be highlighted.

2.  **Switch Context:** To change to a different Kubernetes cluster:
    ```bash
    kubectx <context_name>
    # OR (if installed via Krew)
    kubectl ctx <context_name>
    ```
    Replace `<context_name>` with the name of the target context from the list.

3.  **Switch Back to Previous Context:** Quickly return to the last active context:
    ```bash
    kubectx -
    # OR (if installed via Krew)
    kubectl ctx -
    ```

**Integration with `kubectl`:**

`kubectx` directly modifies your `kubectl` configuration file (`~/.kube/config`). After switching with `kubectx`, all subsequent `kubectl` commands will target the selected cluster.

**Example Workflow:**

1.  You are working with your development cluster.
2.  You need to interact with a production cluster.
3.  Run `kubectx production`.
4.  Execute `kubectl get pods -n kube-system`. This will target your production cluster.
5.  Switch back to development with `kubectx development` or `kubectx -`.

**Key Benefits on Linux:**

* **Simplified Cluster Switching:** Easily manage multiple Kubernetes clusters from your Linux terminal.
* **Improved Workflow:** Reduces the need to remember or type long `--context` flags for `kubectl`.
* **Clear Context Awareness:** The highlighting of the current context helps avoid accidental operations on the wrong cluster.

By using `kubectx` on Linux, you can significantly streamline your interactions with multiple Kubernetes environments.