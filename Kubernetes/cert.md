# TLS Certificates & Kubernetes – Deep-Dive Wiki

---

## 🔹 1. What Is TLS?

**TLS (Transport Layer Security)** is the successor to SSL, used to:

- Authenticate parties (server/client)
- Encrypt communication
- Ensure message integrity

TLS uses **X.509 certificates** and **asymmetric cryptography**:

- **Public key** encrypts
- **Private key** decrypts
- Certificates bind a public key to an identity (domain, user, system)

---

## 🔹 2. TLS Certificate Types

| Certificate Type     | Description                                                 |
| -------------------- | ----------------------------------------------------------- |
| **CA (Root)**        | Self-signed, trusted root authority                         |
| **Intermediate CA**  | Issued by root, signs end-entity certs                      |
| **Server cert**      | Proves server identity (e.g., `myapp.com`)                  |
| **Client cert**      | Used in **mutual TLS** to identify clients (e.g., kubelets) |
| **Self-signed cert** | Not trusted by default; useful for internal services/dev    |

---

## 🔹 3. TLS in Kubernetes

### 🔸 Internal Control Plane Communication

| Component          | Uses TLS For                    |
| ------------------ | ------------------------------- |
| kube-apiserver     | Talks securely to kubelet, etcd |
| kubelet            | Verifies apiserver cert         |
| etcd               | Uses client/server certs        |
| controller-manager | Uses kubeconfig with certs      |
| scheduler          | Same as above                   |

**Certificates involved:**

- `apiserver.crt`, `apiserver.key`
- `ca.crt`, `ca.key`
- `etcd/server.crt`, `etcd/peer.crt`
- `kubelet.crt`, `kubelet.key`

You can inspect them with:

```bash
openssl x509 -in apiserver.crt -noout -text
```

---

### 🔸 Ingress + HTTPS

Ingress can terminate TLS:

```yaml
spec:
  tls:
    - hosts:
        - myapp.example.com
      secretName: myapp-tls
```

Kubernetes will use the cert/key from that secret to enable HTTPS.

---

### 🔸 TLS Secrets

TLS secrets are a special kind:

```bash
kubectl create secret tls my-tls \
  --cert=public.crt \
  --key=private.key
```

Resulting YAML:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-tls
type: kubernetes.io/tls
data:
  tls.crt: <base64>
  tls.key: <base64>
```

---

### 🔸 cert-manager

`cert-manager` handles:

- Issuing TLS certs (via Let's Encrypt, Vault, Venafi, etc.)
- Renewing them
- Storing them as secrets

#### Example:

```yaml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: you@example.com
    privateKeySecretRef:
      name: letsencrypt-key
    solvers:
    - http01:
        ingress:
          class: nginx
```

---

## 🔹 4. How to Create TLS Certificates Manually

### 🔸 With OpenSSL

```bash
# Create a private key
openssl genrsa -out tls.key 2048

# Generate CSR
openssl req -new -key tls.key -out tls.csr -subj "/CN=myapp.example.com"

# Generate certificate
openssl x509 -req -in tls.csr -signkey tls.key -out tls.crt -days 365
```

To inspect:

```bash
openssl x509 -in tls.crt -text -noout
```

---

### 🔸 With CFSSL (Cloudflare’s tool)

```bash
cfssl genkey -initca csr.json | cfssljson -bare ca
```

CFSSL is used to bootstrap entire PKI chains.

---

## 🔹 5. TLS Certificate Lifecycle

| Stage        | Description                                       |
| ------------ | ------------------------------------------------- |
| Creation     | Private key + CSR + Signing                       |
| Storage      | Secrets or files (e.g., in `/etc/kubernetes/pki`) |
| Distribution | Mounted into containers / kubeconfigs             |
| Renewal      | cert-manager or cron job                          |
| Revocation   | Rare in Kubernetes, mostly replace expired        |

---

## 🔹 6. Troubleshooting TLS in Kubernetes

### 🔸 Common Errors

| Error                                         | Cause                             |
| --------------------------------------------- | --------------------------------- |
| x509: certificate signed by unknown authority | Wrong/missing CA cert             |
| expired certificate                           | Cert not renewed                  |
| unable to verify cert chain                   | Intermediate cert missing         |
| handshake failure                             | Wrong cipher suite or TLS version |

Use:

```bash
openssl s_client -connect <host>:443
```

Or:

```bash
kubectl describe ingress <name>
```

---

## 🔹 7. TLS in the CKA Exam

### 🔸 What to Expect

- Creating TLS secrets
- Inspecting certs using `openssl`
- Fixing expired or wrong certs
- Verifying secure connection to apiserver
- Configuring Ingress with TLS
- Using or inspecting `/etc/kubernetes/pki`

---

## 📦 Bonus: File Paths in kubeadm Clusters

| Component  | Cert path                             |
| ---------- | ------------------------------------- |
| CA         | `/etc/kubernetes/pki/ca.crt`          |
| API Server | `/etc/kubernetes/pki/apiserver.crt`   |
| Kubelet    | `/var/lib/kubelet/pki/kubelet.crt`    |
| etcd       | `/etc/kubernetes/pki/etcd/server.crt` |

---

## 📚 Useful Commands

```bash
kubectl get secrets
kubectl describe secret my-tls
openssl x509 -in tls.crt -noout -text
openssl s_client -connect myapp.example.com:443
kubectl create secret tls ...
```

