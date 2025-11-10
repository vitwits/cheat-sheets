# Microsoft Entra ID: Azure Directory Services

**Microsoft Entra ID** (formerly Azure Active Directory) is Microsoft's cloud-based identity and access management (IAM) service. It enables secure sign-in and access to Microsoft cloud applications, custom-developed apps, and integration with on-premises Active Directory deployments.

---

## Overview

Microsoft Entra ID serves as a centralized directory service in the cloud, contrasting with traditional on-premises **Active Directory (AD)** running on Windows Server. While on-premises AD is fully managed by the organization, Microsoft Entra ID is hosted and maintained by Microsoft, ensuring global availability and built-in security monitoring.

### Key Differences from On-Premises Active Directory

| Feature                        | On-Premises Active Directory               | Microsoft Entra ID                          |
|-------------------------------|--------------------------------------------|---------------------------------------------|
| **Management**                | Organization-managed                       | Microsoft-managed (cloud)                   |
| **Sign-in Monitoring**        | No built-in suspicious activity detection  | Detects risky sign-ins (e.g., unknown locations/devices) |
| **Infrastructure**            | Requires servers, patching, backups        | Fully managed; no infrastructure overhead   |
| **Scalability**               | Limited by hardware                        | Globally distributed and scalable           |

---

## Who Uses Microsoft Entra ID?

Microsoft Entra ID caters to various roles and user types:

- **IT Administrators**  
  Control access to apps and resources based on business policies.

- **Application Developers**  
  Integrate standards-based authentication (e.g., SSO, OAuth, OpenID Connect) into custom apps.

- **End Users**  
  Self-manage identities via password resets, profile updates, and app access through the My Apps portal.

- **Online Service Subscribers**  
  Automatically used by Microsoft 365, Office 365, Azure, and Dynamics CRM Online for authentication.

---

## Core Capabilities

Microsoft Entra ID provides foundational identity services:

### 1. **Authentication**
   - Identity verification for apps and resources
   - **Self-Service Password Reset (SSPR)**
   - **Multifactor Authentication (MFA)**
   - Custom banned password lists
   - Smart lockout to prevent brute-force attacks

### 2. **Single Sign-On (SSO)**
   - One set of credentials for multiple applications
   - Simplifies user experience and security management
   - Centralized access control when users change roles or leave

### 3. **Application Management**
   - Manage cloud and on-premises apps
   - Features:
     - **Application Proxy** – Secure remote access to on-prem apps
     - **SaaS App Integration** – Pre-built connectors for thousands of apps
     - **My Apps Portal** – User-friendly app launcher
     - SSO across hybrid environments

### 4. **Device Management**
   - Register devices in Microsoft Entra ID
   - Enables:
     - Integration with **Microsoft Intune** for MDM/MAM
     - **Device-based Conditional Access** policies
     - Restrict access to known/approved devices

---

## Hybrid Integration: Connecting On-Premises AD

Avoid managing duplicate identities across on-premises and cloud environments.

### Tool: **Microsoft Entra Connect**
- Synchronizes user accounts, groups, and password hashes
- Enables:
  - Consistent SSO across cloud and on-premises
  - MFA and SSPR in both environments
  - Hybrid identity consistency

> **Sync Direction**: Bidirectional changes (e.g., password updates) are synchronized.

---

## Microsoft Entra Domain Services

A **managed domain service** providing traditional AD-compatible features without managing domain controllers.

### Use Cases
- Run legacy applications requiring:
  - Domain join
  - Group Policy
  - LDAP
  - Kerberos/NTLM authentication
- Lift-and-shift on-premises apps to Azure without rearchitecting authentication

### How It Works

| Component                  | Description |
|---------------------------|-----------|
| **Managed Domain**         | Fully managed by Azure; no DC administration required |
| **Replica Set**            | Two Windows Server domain controllers deployed in your Azure region |
| **Namespace**              | Custom domain name (e.g., `aaddscontoso.com`) |
| **Synchronization**        | **One-way** from Microsoft Entra ID → Entra Domain Services |
| **Hybrid Sync**            | On-prem AD → Entra ID (via Entra Connect) → Entra Domain Services |

> **Note**: Resources created directly in the managed domain are **not** synced back to Microsoft Entra ID.

### Security & Management
- Backups handled by Azure
- Encryption at rest via **Azure Disk Encryption**
- No need to patch, update, or monitor DCs

---

## Benefits Summary

| Benefit | Description |
|-------|-------------|
| **Reduced Admin Overhead** | No infrastructure to maintain |
| **Enhanced Security** | Built-in risk detection, MFA, Conditional Access |
| **Hybrid Flexibility** | Seamless integration with on-prem AD |
| **Legacy App Support** | Run older apps in the cloud via Entra Domain Services |
| **Scalability** | Global, highly available service |

---

## Next Steps

- [Describe Azure Authentication Methods](./authentication-methods.md)
- Explore **Conditional Access**, **Privileged Identity Management (PIM)**, and **Identity Protection**

---


# Azure Authentication Methods

Authentication is the process of establishing the identity of a person, service, or device. In simple terms, it is like showing an ID when traveling: it proves who you are, but it does not confirm a ticket. Azure provides multiple ways to authenticate users, devices, and services, balancing **security** and **convenience**.

---

## Table of Contents
1. [Authentication Overview](#authentication-overview)
2. [Single Sign-On (SSO)](#single-sign-on-sso)
3. [Multifactor Authentication (MFA)](#multifactor-authentication-mfa)
4. [Passwordless Authentication](#passwordless-authentication)
   - [Windows Hello for Business](#windows-hello-for-business)
   - [Microsoft Authenticator App](#microsoft-authenticator-app)
   - [FIDO2 Security Keys](#fido2-security-keys)
5. [Comparing Authentication Methods](#comparing-authentication-methods)
6. [Best Practices](#best-practices)

---

## Authentication Overview

Authentication is required to confirm the identity of:
- **Users** (humans)
- **Services** (applications, APIs)
- **Devices** (computers, IoT)

### Authentication Methods in Azure
- **Passwords**: traditional, easy but less secure
- **Single Sign-On (SSO)**: one credential for multiple apps
- **Multifactor Authentication (MFA)**: additional factors required
- **Passwordless**: no password, uses device or biometrics

Modern authentication solutions aim to achieve **both security and convenience**. For example:
- **Passwords only**: High convenience, low security
- **Passwordless**: High security, high convenience
- **Password + MFA**: Very secure, medium convenience

---

## Single Sign-On (SSO)

**Definition:**  
SSO allows users to sign in once and access multiple applications and services without signing in again.

**How it works:**
- Applications must **trust the initial authenticator**.
- A user signs in once; subsequent applications use that trust.

**Benefits:**
- Only **one set of credentials** to remember
- Reduces helpdesk workload: fewer password resets
- Simplifies account lifecycle management: access tied to a single identity

**Risks:**
- SSO is only as secure as the **initial authentication**.

**Example Scenario:**
- A user logs into Office 365 using Entra ID credentials.
- The same login grants access to SharePoint, Teams, and third-party SaaS apps like Salesforce.

---

## Multifactor Authentication (MFA)

**Definition:**  
MFA requires **two or more forms of verification** during sign-in.

**Types of factors:**
1. **Something you know**: password, PIN, challenge question
2. **Something you have**: mobile phone, security token
3. **Something you are**: fingerprint, facial recognition

**Benefits:**
- Reduces the risk of compromised credentials
- Adds a strong security layer beyond password-only authentication

**Example Scenario:**
1. User enters username and password
2. System prompts for a one-time code sent to phone
3. Access granted only after providing both

**Microsoft Entra MFA:**
- A service that allows users to choose additional authentication methods during sign-in, such as:
  - Phone call
  - Mobile app notification

---

## Passwordless Authentication

**Definition:**  
Authentication method where **passwords are removed**. Identity verification uses **something you have**, **something you are**, or **something you know**.

**Benefits:**
- Eliminates risk of password theft
- Higher user adoption due to convenience
- Seamless integration with devices and apps

### Windows Hello for Business
- Uses **biometrics or PIN**
- Tied directly to a user’s Windows PC
- Integrated with **Single Sign-On**
- Prevents unauthorized access from other devices

### Microsoft Authenticator App
- Turns **iOS/Android devices** into strong credentials
- Passwordless login: notification → confirm with PIN/biometric
- Works on multiple platforms and browsers

### FIDO2 Security Keys
- Hardware-based authentication standard (USB, Bluetooth, NFC)
- Uses **WebAuthn standard** for passwordless login
- Reduces phishing risks
- User registers key and uses it to sign in instead of a password

---

## Comparing Authentication Methods

| Method                   | Security       | Convenience        | Example                                   |
|---------------------------|----------------|-----------------|-------------------------------------------|
| Password                  | Low            | High            | Traditional password login                |
| Password + MFA            | High           | Medium          | Email + SMS code                          |
| Passwordless              | High           | High            | Windows Hello, Authenticator app, FIDO2  |
| SSO                       | Medium/High    | High            | Office 365 login grants access to multiple apps |

---

## Best Practices
- Enable MFA wherever possible
- Consider passwordless options for higher security and convenience
- Use SSO to simplify identity management and reduce helpdesk workload
- Always secure the **initial authenticator** in SSO setups
- Train users on recognizing phishing attempts and device security

---

# Azure External Identities

An **external identity** is a person, device, service, or application that exists **outside your organization**. Microsoft Entra External ID allows you to **securely interact with users outside your organization**, whether for business collaboration or consumer-facing applications.

External identities are useful for:
- Collaborating with partners, suppliers, vendors, or distributors.
- Managing customer identity experiences for consumer apps.
- Controlling access to your resources while keeping them secure.

---

## How External Identities Work

External identities allow users to **bring their own identities**. They can sign in using:
- Corporate or government-issued digital identities
- Unmanaged social identities (e.g., Google, Facebook)

> The external user’s identity provider manages their credentials, while you control **access to your apps** using Microsoft Entra ID or Azure AD B2C.

**Example Diagram Concept**  
- **B2B collaborators** access your tenant.  
- **B2C collaborators** access the AD B2C tenant.  

---

## Key Capabilities of External Identities

### 1. Business-to-Business (B2B) Collaboration
- Allows external users to **use their preferred identity** to access your Microsoft applications or other enterprise applications (SaaS, custom apps).  
- B2B users are typically represented in your directory as **guest users**.

**Example:**  
Invite a partner employee to collaborate on a SharePoint site using their corporate account. They appear in your Azure AD as a guest user.

---

### 2. B2B Direct Connect
- Establishes a **mutual, two-way trust** with another Microsoft Entra organization.  
- Enables **seamless collaboration** without requiring guest representation in your directory.  
- Currently supports **Teams shared channels**.  
- Administrators can monitor access through Teams admin center reports.

**Example:**  
A collaborator from another company can join your Teams shared channel from their own Teams instance, without creating a guest account in your tenant.

---

### 3. Business-to-Customer (B2C)
- Designed for **consumer-facing apps** (SaaS or custom-developed, excluding Microsoft apps).  
- Uses **Azure AD B2C** for identity and access management.

**Example:**  
Customers sign up for an e-commerce app using their Google or Microsoft account, managed securely through Azure AD B2C.

---

## Managing External Identities

### Inviting Guest Users
- Administrators or other users can invite external users to your tenant.
- Social identities like Microsoft accounts can also be used.

### Controlling Access
- Access reviews allow you to **verify and recertify guest access**.  
- Reviewers can provide input based on Microsoft Entra ID suggestions.  
- Access can be **revoked** for guests who no longer need it.

---

## Summary

External Identities in Microsoft Entra allow organizations to:
1. Collaborate securely with external partners (B2B).  
2. Enable seamless two-way trust relationships (B2B Direct Connect).  
3. Provide secure access for customers or consumers (B2C).  
4. Maintain control over access through reviews and recertification.

---

# Azure Conditional Access

**Conditional Access** is a tool in **Microsoft Entra ID** that allows or denies access to resources based on **identity signals**.  

### Key Identity Signals
- **Who the user is** – their account or role
- **Where the user is** – location or network
- **What device the user is using** – managed vs unmanaged device

Conditional Access helps IT administrators to:
1. **Empower users** – enable productivity wherever and whenever.
2. **Protect organizational assets** – enforce security policies dynamically.
3. Provide **granular MFA** – apply second-factor authentication based on conditions.

---

## How Conditional Access Works

During sign-in, Conditional Access:
1. **Collects signals** from the user, device, and application.
2. **Evaluates the conditions** based on configured policies.
3. **Enforces actions**, such as:
   - Allowing full access
   - Blocking access
   - Requiring MFA

### Example Flow
1. Signal: User signs in from a known location
   - Decision: Allow full access
   - Enforcement: Access granted immediately
2. Signal: User signs in from an unusual or high-risk location
   - Decision: Require second form of authentication or block access
   - Enforcement: Prompt for MFA or deny access

---

## Use Cases for Conditional Access

1. **Require MFA selectively**
   - Example: Administrators require MFA, regular users do not.
   - Example: Users connecting from outside the corporate network require MFA.

2. **Restrict access to approved client applications**
   - Example: Only allow official email apps to connect to your email service.

3. **Require access from managed devices**
   - Example: Only devices that meet security/compliance standards can access resources.

4. **Block untrusted or risky access**
   - Example: Deny login attempts from unknown or unexpected locations.

---

## Summary

Conditional Access allows organizations to:
- Dynamically enforce security policies based on context
- Balance productivity and security
- Apply targeted MFA and device compliance rules
- Protect sensitive resources without impacting all users equally

---

Next Unit: **Describe Azure role-based access control**

---

# Azure Role-Based Access Control (RBAC)

When you have multiple IT or engineering teams, it's important to control **who has access to what resources** in your Azure environment.  

The **principle of least privilege** states that users should only have access **up to the level needed to complete their tasks**.  
- Example: If a user only needs read access to a storage blob, they should not have write access or access to other blobs.

Managing individual permissions for every user and resource would be tedious. Azure solves this with **Role-Based Access Control (RBAC)**.

---

## What is Azure RBAC?

**Azure RBAC** enables you to manage access **through roles** rather than assigning permissions individually.  

### Key Points:
- **Built-in roles:** Predefined roles for common access patterns.
- **Custom roles:** Define roles with specific permissions as needed.
- **Role assignment:** Users or groups assigned to a role inherit the permissions associated with that role.

**Example:**
- Adding a new engineer to the "Engineers" RBAC group automatically grants them the same permissions as existing engineers.
- Adding new resources and assigning them to an RBAC group automatically gives all group members access.

---

## How RBAC is Applied

RBAC is applied to a **scope**, which can be a resource or set of resources.  

### Scopes include:
1. **Management group** – a collection of subscriptions
2. **Subscription** – a collection of resource groups
3. **Resource group** – a collection of related resources
4. **Single resource** – e.g., a storage account, VM, or database

**Role Examples:**
- **Owner:** Full control over a scope
- **Reader:** Can view resources but cannot make changes
- **Contributor:** Can manage resources but cannot assign roles

> RBAC is hierarchical: permissions granted at a **parent scope** are inherited by **child scopes**.

**Example:**
- Assign Owner role at the management group → user can manage all subscriptions and resources under that group.
- Assign Reader role at the subscription → users can view all resource groups and resources under that subscription.

---

## How RBAC is Enforced

RBAC enforcement occurs on any action initiated through **Azure Resource Manager**, the management service for Azure resources.

**Access Methods:**
- Azure Portal
- Azure Cloud Shell
- Azure PowerShell
- Azure CLI

**Important Notes:**
- RBAC controls **resource-level permissions**, not application or data-level security.
- Azure RBAC uses an **allow model**:  
  - Multiple role assignments are cumulative.  
  - Example: A user with Reader and Contributor roles on the same scope can read and write to that scope.

---

## Summary

Azure RBAC enables organizations to:
- Implement **least privilege access**
- Manage access **efficiently via roles**
- Apply permissions at multiple **hierarchical scopes**
- Ensure consistent access management across multiple users, groups, and resources

---

# Zero Trust Model

The **Zero Trust** security model assumes the **worst-case scenario**: that a breach has already occurred. Every access request is treated as if it originates from an uncontrolled or untrusted network.

Zero Trust adapts to modern environments with:
- Mobile and remote workforces
- Cloud services and hybrid infrastructure
- Protection for people, devices, applications, and data, wherever they are located

---

## Core Principles of Zero Trust

1. **Verify Explicitly**  
   - Always authenticate and authorize based on **all available data points**  
   - Example: User identity, device health, location, session risk, and more

2. **Use Least Privilege Access**  
   - Grant only the **minimum permissions** needed to perform a task  
   - Techniques:  
     - Just-In-Time (JIT) access  
     - Just-Enough-Access (JEA)  
     - Risk-based adaptive policies  
     - Data protection controls

3. **Assume Breach**  
   - Operate as if a breach has already occurred  
   - Minimize **blast radius** through segmentation  
   - Verify **end-to-end encryption**  
   - Use analytics for visibility, threat detection, and defense improvement

---

## Adjusting to Zero Trust

**Traditional Model:**  
- Corporate network assumed safe  
- Only managed devices allowed  
- VPN tightly controlled  
- Personal devices often blocked

**Zero Trust Model:**  
- Location or network is **not trusted by default**  
- Every user and device must **authenticate**  
- Access is granted based on **identity, device compliance, and policy**, not network location

**Example:**  
- A user trying to access Azure resources from home must authenticate via MFA and meet device compliance policies, even if previously connected within the corporate network.

---

## Benefits of Zero Trust

- Reduces risk of lateral movement during a breach  
- Protects sensitive resources and data in hybrid/multi-cloud environments  
- Provides consistent security policies for users regardless of location  
- Enhances visibility and control through analytics and continuous monitoring

---

# Defense-in-Depth

**Defense-in-Depth** is a **security strategy** designed to protect information and resources by using **multiple layers of protection**.  
The goal is to slow down or prevent unauthorized access and give security teams multiple points to detect and respond to attacks.

Think of it as **layers of an onion**: the most critical assets (data) are in the center, and each surrounding layer provides protection so that if one layer is breached, others are still in place.

---

## Layers of Defense-in-Depth

### 1. Physical Security
- Protects **datacenter hardware** and infrastructure from physical theft, damage, or tampering.
- Mechanisms include:
  - Controlled access to buildings
  - Security cameras
  - Locks and access cards
- **Example:** Unauthorized personnel cannot physically access servers hosting Azure resources.

---

### 2. Identity and Access
- Ensures **only authorized users and devices** can access resources.
- Key practices:
  - Single Sign-On (SSO)
  - Multifactor Authentication (MFA)
  - Audit logs for sign-in events and changes
- **Example:** Admins must use MFA to log in and can only manage resources needed for their role (principle of least privilege).

---

### 3. Perimeter Security
- Protects resources from **network-based attacks** before they reach internal systems.
- Tools:
  - **DDoS Protection:** Filters large-scale attacks
  - **Perimeter Firewalls:** Detect and block malicious traffic
- **Example:** Preventing a DDoS attack from bringing down a web application.

---

### 4. Network Security
- Limits communication between resources to **only what is required**, reducing the attack surface.
- Best practices:
  - Segment networks (VNet, subnets)
  - Deny traffic by default
  - Restrict inbound/outbound traffic
  - Secure connectivity to on-premises networks
- **Example:** Only allowing your web server to communicate with the database server on a specific port.

---

### 5. Compute Security
- Focuses on protecting **virtual machines and compute resources** from malware or vulnerabilities.
- Practices:
  - Secure VM access
  - Endpoint protection
  - Regular patching
- **Example:** Applying automatic updates and antivirus on Azure VMs to prevent ransomware infection.

---

### 6. Application Security
- Integrates security into **development and deployment**.
- Best practices:
  - Ensure code is secure and free of vulnerabilities
  - Store secrets safely (Key Vault, managed identities)
  - Make security a design requirement
- **Example:** Using Azure Key Vault to store database passwords securely instead of hardcoding them.

---

### 7. Data Security
- Protects **business and customer data** at rest, in transit, and in use.
- Important for **regulatory compliance** and sensitive information.
- Examples:
  - Data stored in databases, disks, or SaaS apps like Office 365
  - Cloud storage with encryption
- **Example:** Encrypting SQL databases in Azure to prevent unauthorized access even if a VM is compromised.

---

## Summary

- **Defense-in-Depth** relies on multiple layers rather than a single security control.
- Each layer **compensates for weaknesses** in other layers.
- Layers work together to **slow down attacks**, **detect breaches**, and **protect critical data**.
- Azure provides tools and features at **every layer**:
  - Physical: Azure datacenter security
  - Identity & Access: Entra ID, SSO, MFA
  - Perimeter & Network: Azure Firewall, DDoS Protection, NSGs
  - Compute: Azure VM security, endpoint protection
  - Application: Secure coding practices, Key Vault
  - Data: Encryption, role-based access, Azure Storage security

---

# Microsoft Defender for Cloud

**Microsoft Defender for Cloud** is a monitoring and security management tool that helps you **assess, secure, and defend** your cloud and hybrid environments.  
It works across **Azure, on-premises, and other cloud platforms** (AWS, GCP) and provides recommendations, alerts, and threat protection.

---

## Key Features

### 1. Protection Everywhere
- **Azure-native**: Many Azure services are monitored automatically.
- **Hybrid and multicloud**: Protect non-Azure servers using **Azure Arc**.
- **Automatic deployment**: Log Analytics agents collect security data as needed.
- **Cloud Security Posture Management (CSPM)**: Assesses resources without agents in multicloud setups.

---

### 2. Azure-Native Protections
Defender for Cloud detects threats across:

1. **Azure PaaS services**  
   - Examples: Azure App Service, SQL, Storage Account  
   - Detect anomalies in activity logs using **Defender for Cloud Apps**.

2. **Azure Data Services**  
   - Vulnerability assessment for Azure SQL and Storage  
   - Automatic data classification and security recommendations

3. **Networks**  
   - Reduce exposure to brute force attacks  
   - Use **Just-in-Time (JIT) VM access** and secure port policies

---

### 3. Hybrid and Multicloud Resources
- Extend Defender for Cloud to **on-premises servers** via **Azure Arc**
- Protect **AWS and GCP resources**
  - AWS: CSPM assessments, compliance with CIS, PCI DSS
  - Containers: Defender for Containers on EKS Linux clusters
  - Servers: Defender for Servers for Windows/Linux EC2 instances

---

## Core Capabilities

### Assess, Secure, Defend


#### 1. Continuously Assess
- Identify and track **vulnerabilities** in your environment
- Vulnerability scans for:
  - Virtual machines
  - Container registries
  - SQL servers
- **Integration with Microsoft Defender for Endpoint** for server-level vulnerabilities
- Provides detailed reports and recommendations

#### 2. Secure
- Enforce **security policies** based on **Azure Security Benchmark**
- Policies can be applied to:
  - Management groups
  - Subscriptions
  - Entire tenants
- Constant monitoring ensures **newly deployed resources** meet security best practices
- Recommendations help **reduce attack surface** and improve security posture
- **Secure Score** gives an at-a-glance measure of your environment’s health

#### 3. Defend
- Provides **security alerts** and **advanced threat protection**:
  - Details affected resources
  - Suggests remediation
  - Can trigger automated responses (e.g., Logic Apps)
- **Fusion kill-chain analysis** correlates alerts across systems to understand attack campaigns
- Protects resources including:
  - Virtual Machines
  - SQL Databases
  - Containers
  - Web Applications
  - Network components
- Features include:
  - **Just-in-Time access** for VM management ports
  - Adaptive application controls (allowlists)

---

## Summary

**Microsoft Defender for Cloud** provides a comprehensive security solution for:

- **Continuous assessment** of vulnerabilities  
- **Security hardening** of workloads and resources  
- **Threat detection and response** across Azure, on-premises, and multicloud environments

> Tip: Defender for Cloud is your central **security control plane** to manage posture, alerts, and threat protection across all environments.

---



