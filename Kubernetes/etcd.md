# etcd Commands Cheat Sheet

## Starting and Managing etcd
```sh
# Start etcd (standalone)
etcd

# Start etcd with a specific data directory
etcd --data-dir /var/lib/etcd

# Check etcd version
etcd --version
```

## Setting and Getting Keys
```sh
# Put a key-value pair
etcdctl put mykey "Hello, etcd!"

# Get the value of a key
etcdctl get mykey

# Get all keys
etcdctl get "" --prefix
```

## Deleting Keys
```sh
# Delete a specific key
etcdctl del mykey

# Delete keys with a common prefix
etcdctl del "myprefix" --prefix
```

## Watching for Changes
```sh
# Watch a key for changes
etcdctl watch mykey

# Watch all keys with a common prefix
etcdctl watch "myprefix" --prefix
```

## Transactions (Atomic Operations)
```sh
# Execute a transaction
etcdctl txn <<EOF
compare:
    value("counter") > "0"
success:
    put("counter", "10")
failure:
    put("counter", "0")
EOF
```

## Listing and Managing Members
```sh
# List etcd cluster members
etcdctl member list

# Add a new member to the cluster
etcdctl member add new-node --peer-urls=http://192.168.1.100:2380

# Remove a member from the cluster
etcdctl member remove <member-ID>
```

## Snapshots and Backup
```sh
# Save a snapshot of the etcd database
etcdctl snapshot save /backup/etcd-snapshot.db

# Restore a snapshot
etcdctl snapshot restore /backup/etcd-snapshot.db
```

## Cluster Health and Status
```sh
# Check cluster health
etcdctl endpoint health

# Get cluster status
etcdctl endpoint status --write-out=table
```

## Lease Management (TTL for keys)
```sh
# Create a lease with 60 seconds TTL
etcdctl lease grant 60

# Attach a lease to a key
etcdctl put mykey "temp value" --lease=<lease-ID>

# Revoke a lease
etcdctl lease revoke <lease-ID>
```

## Authentication and Role-Based Access Control (RBAC)
```sh
# Enable authentication
etcdctl auth enable

# Create a new user
etcdctl user add myuser:password

# Assign a role to a user
etcdctl user grant-role myuser root
```

## Changing API Version
```sh
# Set etcdctl to use API v2
export ETCDCTL_API=2

# Set etcdctl to use API v3
export ETCDCTL_API=3
```

## Environment Variables for etcdctl
```sh
export ETCDCTL_API=3  # Ensure API v3 is used
export ETCDCTL_ENDPOINTS="http://localhost:2379"
```

---
This cheat sheet covers the most commonly used etcd commands. Adjust the commands as needed based on your environment.