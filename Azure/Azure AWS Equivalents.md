
## ☁️ AWS ↔ Azure Service Equivalents

| **Category**                         | **AWS Service**                      | **Azure Equivalent**                                                 | **Notes**                                 |
| ------------------------------------ | ------------------------------------ | -------------------------------------------------------------------- | ----------------------------------------- |
| **Compute**                          | EC2 (Elastic Compute Cloud)          | Virtual Machines                                                     | Basic IaaS compute instances              |
|                                      | Auto Scaling                         | Virtual Machine Scale Sets                                           | Automatically scale VMs                   |
|                                      | Elastic Beanstalk                    | App Service / Azure Spring Apps                                      | PaaS app hosting                          |
|                                      | Lambda                               | Azure Functions                                                      | Serverless functions                      |
|                                      | ECS (Elastic Container Service)      | Azure Container Instances / Azure Container Apps                     | Container orchestration                   |
|                                      | EKS (Elastic Kubernetes Service)     | Azure Kubernetes Service (AKS)                                       | Managed Kubernetes                        |
|                                      | Lightsail                            | App Service / Container Apps (simplified hosting)                    | Simplified app hosting                    |
|                                      | AWS Batch                            | Azure Batch                                                          | Batch computing                           |
| **Storage**                          | S3 (Simple Storage Service)          | Blob Storage                                                         | Object storage                            |
|                                      | EBS (Elastic Block Store)            | Managed Disks                                                        | Block-level storage for VMs               |
|                                      | EFS (Elastic File System)            | Azure Files                                                          | Managed file shares                       |
|                                      | Glacier                              | Azure Archive Storage                                                | Archival storage tier                     |
|                                      | Storage Gateway                      | Azure File Sync / Blob lifecycle policies                            | Hybrid storage integration                |
|                                      | FSx                                  | Azure NetApp Files                                                   | Managed file systems                      |
| **Databases**                        | RDS (Relational Database Service)    | Azure SQL Database / Azure Database for PostgreSQL / MySQL / MariaDB | Managed relational databases              |
|                                      | Aurora                               | Azure SQL Managed Instance                                           | High-performance managed SQL              |
|                                      | DynamoDB                             | Cosmos DB                                                            | NoSQL key-value/document DB               |
|                                      | Redshift                             | Synapse Analytics                                                    | Data warehouse                            |
|                                      | ElastiCache                          | Azure Cache for Redis                                                | In-memory caching                         |
|                                      | Neptune                              | Cosmos DB (Gremlin API) / Digital Twins                              | Graph database                            |
|                                      | DocumentDB                           | Cosmos DB                                                            | Document-based DB                         |
| **Networking**                       | VPC (Virtual Private Cloud)          | Virtual Network (VNet)                                               | Isolated network                          |
|                                      | Route 53                             | Azure DNS                                                            | Domain name services                      |
|                                      | CloudFront                           | Azure Front Door / CDN                                               | Content delivery network                  |
|                                      | Elastic Load Balancer (ELB)          | Azure Load Balancer / Application Gateway                            | Load balancing                            |
|                                      | Direct Connect                       | ExpressRoute                                                         | Private network connection                |
|                                      | VPN Gateway                          | VPN Gateway                                                          | Site-to-site VPN                          |
|                                      | API Gateway                          | API Management                                                       | Managed API gateway                       |
|                                      | Global Accelerator                   | Azure Front Door                                                     | Global routing acceleration               |
| **Security / Identity**              | IAM (Identity and Access Management) | **Azure Active Directory (Entra ID)** + **Azure RBAC**               | Split between identity and access control |
|                                      | STS (Security Token Service)         | Azure AD Token Service (OAuth 2.0 / OIDC)                            | Token-based auth                          |
|                                      | Cognito                              | Azure AD B2C                                                         | Identity federation for apps              |
|                                      | KMS (Key Management Service)         | Key Vault                                                            | Key, secret, and certificate storage      |
|                                      | CloudHSM                             | Managed HSM                                                          | Hardware security module                  |
|                                      | GuardDuty                            | Microsoft Defender for Cloud                                         | Threat detection                          |
|                                      | WAF                                  | Azure Web Application Firewall                                       | Web application protection                |
|                                      | Shield                               | Azure DDoS Protection                                                | DDoS defense                              |
| **Monitoring / Management / DevOps** | CloudWatch                           | Azure Monitor                                                        | Metrics and logging                       |
|                                      | CloudTrail                           | Activity Log                                                         | Audit logs                                |
|                                      | X-Ray                                | Application Insights                                                 | Distributed tracing                       |
|                                      | Config                               | Azure Policy / Azure Blueprints                                      | Resource compliance                       |
|                                      | Systems Manager                      | Azure Automation / Update Management                                 | Systems automation                        |
|                                      | CloudFormation                       | ARM Templates / Bicep                                                | Infrastructure as Code                    |
|                                      | CodeCommit                           | Azure Repos                                                          | Source control                            |
|                                      | CodeBuild                            | Azure Pipelines (builds)                                             | CI build service                          |
|                                      | CodeDeploy                           | Azure Pipelines (releases)                                           | CD deployment                             |
|                                      | CodePipeline                         | Azure DevOps Pipelines / GitHub Actions                              | CI/CD orchestration                       |
|                                      | OpsWorks                             | Azure Automation / DSC                                               | Configuration management                  |
| **Integration / Messaging**          | SQS (Simple Queue Service)           | Queue Storage / Service Bus Queue                                    | Message queuing                           |
|                                      | SNS (Simple Notification Service)    | Notification Hubs / Service Bus Topics                               | Pub/sub messaging                         |
|                                      | EventBridge                          | Event Grid                                                           | Event-driven integration                  |
|                                      | Step Functions                       | Logic Apps / Durable Functions                                       | Workflow orchestration                    |
|                                      | AppFlow                              | Data Factory / Synapse Pipelines                                     | Data integration                          |
| **Analytics / Big Data / AI**        | Athena                               | Synapse Serverless SQL                                               | Query data in storage                     |
|                                      | Glue                                 | Data Factory                                                         | ETL data pipelines                        |
|                                      | EMR (Elastic MapReduce)              | HDInsight / Synapse Spark                                            | Big data processing                       |
|                                      | QuickSight                           | Power BI                                                             | Business analytics                        |
|                                      | Kinesis                              | Event Hubs / Stream Analytics                                        | Real-time streaming                       |
|                                      | SageMaker                            | Azure Machine Learning                                               | Machine learning platform                 |
|                                      | Comprehend                           | Cognitive Services (Language)                                        | NLP and text analytics                    |
|                                      | Rekognition                          | Cognitive Services (Vision)                                          | Image and video analysis                  |
| **Developer Tools / Misc.**          | Cloud9                               | Visual Studio Codespaces                                             | Cloud IDE                                 |
|                                      | Secrets Manager                      | Key Vault                                                            | Secrets management                        |
|                                      | License Manager                      | Azure Cost Management + Licensing                                    | License governance                        |
|                                      | Organizations                        | Management Groups / Subscriptions                                    | Multi-account management                  |
|                                      | Service Catalog                      | Azure Blueprints / Marketplace                                       | Standardized deployments                  |
|                                      | Trusted Advisor                      | Azure Advisor                                                        | Cost and performance optimization         |

---
