# 🧠 Azure Storage Accounts

## 🔹 What Is an Azure Storage Account?

A **Storage Account** provides a **unique namespace** in Azure for storing data, accessible via **HTTP/HTTPS** from anywhere in the world.

* Secure
* Highly available
* Durable
* Massively scalable

---

## 🔸 Storage Account Types

| **Type**                        | **Supported Services**                                     | **Redundancy Options**               | **Recommended Usage**                                                  |
| ------------------------------- | ---------------------------------------------------------- | ------------------------------------ | ---------------------------------------------------------------------- |
| **Standard general-purpose v2** | Blob, File, Queue, Table Storage (incl. Data Lake Storage) | LRS, GRS, RA-GRS, ZRS, GZRS, RA-GZRS | Default choice for most scenarios. Use for general-purpose workloads.  |
| **Premium block blobs**         | Blob Storage (incl. Data Lake)                             | LRS, ZRS                             | Best for high transaction rates, small objects, or low-latency needs.  |
| **Premium file shares**         | Azure Files                                                | LRS, ZRS                             | For enterprise-level or high-performance apps needing SMB/NFS support. |
| **Premium page blobs**          | Page blobs only                                            | LRS                                  | Used mainly for Azure Virtual Machine disks (fast I/O).                |

---

## 🔸 Redundancy Options

| **Option**                                           | **Description**                                                            |
| ---------------------------------------------------- | -------------------------------------------------------------------------- |
| **LRS** – Locally Redundant Storage                  | Data replicated **3 times** within one data center. Cheapest and simplest. |
| **ZRS** – Zone-Redundant Storage                     | Data replicated across **3 availability zones** in one region.             |
| **GRS** – Geo-Redundant Storage                      | Data copied to a **secondary region**, 100s of km away.                    |
| **RA-GRS** – Read-Access Geo-Redundant Storage       | Like GRS, but with **read access** to the secondary copy.                  |
| **GZRS** – Geo-Zone-Redundant Storage                | Combines **zone + geo redundancy** for high resilience.                    |
| **RA-GZRS** – Read-Access Geo-Zone-Redundant Storage | Adds **read access** to the secondary region for GZRS.                     |

---

## 🔸 Storage Account Naming Rules

* 3–24 characters long
* Lowercase letters and numbers only
* Must be **globally unique** in Azure

✅ Example: `mystorage001`

---

# 🧠 Azure Storage Types — Explained Simply

## 🔹 1. **Blob Storage**

* Think: **"Files for the cloud"**
* Stores **unstructured data** — anything that doesn’t fit into a table or database.
* Examples: images, videos, backups, JSON files, logs, etc.
* Data stored in **containers**, similar to folders.

💬 **Use case:** Store and access files (like on Amazon S3 or Google Cloud Storage).

🧱 **Endpoint:**

```
https://<storage-account-name>.blob.core.windows.net
```

---

## 🔹 2. **Data Lake Storage Gen2**

* Built **on top of Blob Storage**, but designed for **big data analytics**.
* Optimized for tools like **Azure Synapse**, **Databricks**, **HDInsight**, etc.
* Supports **hierarchical namespaces** (folders and directories for massive datasets).

💬 **Use case:** When you need to process or analyze huge amounts of data efficiently.

🧱 **Endpoint:**

```
https://<storage-account-name>.dfs.core.windows.net
```

---

## 🔹 3. **Azure Files**

* Think: **network drive in the cloud (shared folder)**.
* Fully managed **file share** using **SMB** or **NFS** protocols.
* Can be **mounted** directly on Windows, macOS, or Linux — like a local disk.

💬 **Use case:** Replace on-premises file servers or share files between VMs.

🧱 **Endpoint:**

```
https://<storage-account-name>.file.core.windows.net
```

---

## 🔹 4. **Queue Storage**

* Think: **message queue system**.
* Stores messages that applications use to **communicate asynchronously**.
* Each message can be up to 64 KB.
* You can **send**, **receive**, and **process** messages between distributed systems.

💬 **Use case:** Build decoupled apps (like background task processing or event queues).

🧱 **Endpoint:**

```
https://<storage-account-name>.queue.core.windows.net
```

---

## 🔹 5. **Table Storage**

* Think: **NoSQL database** — simple, fast, and scalable.
* Stores data in **tables**, but **without relationships** or foreign keys.
* Each entity (row) has a **PartitionKey** and **RowKey** for fast lookups.

💬 **Use case:** Store structured data that doesn’t need full SQL features (e.g., logs, metadata, user profiles).

🧱 **Endpoint:**

```
https://<storage-account-name>.table.core.windows.net
```

---

## 🔸 Summary Table

| **Service**        | **Type of Data**      | **Typical Use Case**              | **Example Endpoint**                    |
| ------------------ | --------------------- | --------------------------------- | --------------------------------------- |
| **Blob Storage**   | Files (unstructured)  | Images, videos, backups           | `https://<name>.blob.core.windows.net`  |
| **Data Lake Gen2** | Big data files        | Analytics, large datasets         | `https://<name>.dfs.core.windows.net`   |
| **Azure Files**    | Shared file storage   | Network drives, file servers      | `https://<name>.file.core.windows.net`  |
| **Queue Storage**  | Messages              | Background tasks, async workflows | `https://<name>.queue.core.windows.net` |
| **Table Storage**  | Structured NoSQL data | Logs, user data, configs          | `https://<name>.table.core.windows.net` |

---

## 🔹 Summary

| **Feature**   | **Standard (GPv2)**      | **Premium (Block/File/Page)**       |
| ------------- | ------------------------ | ----------------------------------- |
| Storage Types | Blob, File, Queue, Table | Depends on account type             |
| Redundancy    | All options              | Limited (LRS, ZRS)                  |
| Performance   | Standard HDD-based       | SSD-based, low latency              |
| Use Case      | Most workloads           | High performance / low latency apps |

---


# ☁️ Azure Storage Redundancy

Azure automatically keeps **multiple copies** of your data to protect it from hardware failures, power loss, or natural disasters.
This is called **redundancy**.

---

## 🔹 Key Questions to Decide Redundancy

When choosing redundancy, ask:

1. How is data replicated in the **primary region**?
2. Is data also copied to a **secondary (remote) region**?
3. Do I need **read access** to the secondary copy if the primary fails?

---

# 🧱 Redundancy in the **Primary Region**

Azure always stores **3 copies** of your data in the primary region.
There are two replication types for this:

---

## 🟢 **LRS — Locally Redundant Storage**

| Feature       | Description                                                 |
| ------------- | ----------------------------------------------------------- |
| 🔁 Copies     | 3 copies **within a single data center**                    |
| 🌍 Region     | Only in **one data center** (no zones or regions)           |
| 💰 Cost       | Lowest                                                      |
| 💪 Durability | 11 nines (99.999999999%)                                    |
| ⚠️ Risk       | If the data center is destroyed (fire, flood), data is lost |
| 🧠 Use case   | Low-cost, non-critical data, dev/test environments          |

💬 **Analogy:** Like keeping 3 backups of your files on 3 drives — but all in the same room.

---

## 🟢 **ZRS — Zone-Redundant Storage**

| Feature       | Description                                                         |
| ------------- | ------------------------------------------------------------------- |
| 🔁 Copies     | 3 copies **across 3 Availability Zones** (still in the same region) |
| 🌍 Region     | One region, but multiple zones                                      |
| 💰 Cost       | Medium                                                              |
| 💪 Durability | 12 nines (99.9999999999%)                                           |
| ⚙️ Access     | Data stays available for read/write even if one zone fails          |
| 🧠 Use case   | Mission-critical apps needing high availability within a region     |

💬 **Analogy:** Your backups are in **3 different buildings** in the same city.

---

# 🌐 Redundancy with a **Secondary Region**

If you need to survive a **regional disaster** (e.g. entire region offline),
Azure can copy your data to a **paired region** far away (hundreds of miles).

---

## 🟣 **GRS — Geo-Redundant Storage**

| Feature        | Description                                                                   |
| -------------- | ----------------------------------------------------------------------------- |
| 🔁 Copies      | 3 copies in **primary region (LRS)** + 3 copies in **secondary region (LRS)** |
| 🔄 Replication | **Asynchronous** — secondary may lag behind                                   |
| 💪 Durability  | 16 nines (99.99999999999999%)                                                 |
| ⚙️ Access      | Secondary is **read-only after failover**                                     |
| ⚠️ Data lag    | Possible data loss if primary fails suddenly (RPO < 15 min)                   |
| 🧠 Use case    | High durability and disaster recovery needs, no live reads from secondary     |

💬 **Analogy:** You keep 3 drives in your city + 3 more in a city far away.

---

## 🟣 **GZRS — Geo-Zone-Redundant Storage**

| Feature       | Description                                                      |
| ------------- | ---------------------------------------------------------------- |
| 🔁 Copies     | Combines **ZRS in primary region** + **LRS in secondary region** |
| 💪 Durability | 16 nines (99.99999999999999%)                                    |
| ⚙️ Access     | Like GRS — no read access unless failover                        |
| 🧠 Use case   | Maximum protection — covers both zone and regional disasters     |

💬 **Analogy:** You store 3 copies in 3 buildings locally, plus 3 more in another distant city.

---

# 🔍 Optional: Read Access to Secondary Region

You can make the secondary region **readable anytime** (even when primary works fine):

| Option      | Based on | Read Access? | Typical Use                     |
| ----------- | -------- | ------------ | ------------------------------- |
| **RA-GRS**  | GRS      | ✅ Yes        | Disaster-readiness, global apps |
| **RA-GZRS** | GZRS     | ✅ Yes        | Same, but even more resilient   |

💬 **RPO Note:** The secondary data may be **up to ~15 minutes behind** the primary.

---

# 🧾 Summary Table

| **Option**  | **Region(s)** | **Zones?** | **Read Access?** | **Durability**     | **Best for...**                 |
| ----------- | ------------- | ---------- | ---------------- | ------------------ | ------------------------------- |
| **LRS**     | 1             | ❌          | ❌                | 99.999999999%      | Cheapest, dev/test              |
| **ZRS**     | 1             | ✅          | ❌                | 99.9999999999%     | High availability inside region |
| **GRS**     | 2             | ❌          | ❌                | 99.99999999999999% | Disaster recovery               |
| **GZRS**    | 2             | ✅          | ❌                | 99.99999999999999% | Max protection                  |
| **RA-GRS**  | 2             | ❌          | ✅                | 99.99999999999999% | Read access to backup region    |
| **RA-GZRS** | 2             | ✅          | ✅                | 99.99999999999999% | Ultimate redundancy             |

---

# 🧠 Quick Visual Concept (Text Diagram)

```
LRS:   [DC1: A, A, A]                          (1 data center)
ZRS:   [Zone1: A] [Zone2: A] [Zone3: A]       (3 zones in 1 region)
GRS:   [Region1: A,A,A] -> [Region2: B,B,B]   (2 regions)
GZRS:  [Region1-Z1: A] [Z2: A] [Z3: A] -> [Region2: B,B,B]
```

---
