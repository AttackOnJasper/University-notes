# AWS Cloud
## Architecture Evolution
* Traditional Client-Server Architecture
	* Enable multiple distributed systems connecting together
* Evolution: Cloud
	* e.g. Instead of storing stuff in PC, we store in e.g. Google Drive, Dropbox, etc.
* Cloud Basic Components
	* Compute - i.e. CPU + RAM (ability for processing)
	* Storage - database
	* Network - communication means

## AWS History
* 'Invention requires 2 things: 1. The ability to try a lot of experiments, and 2. not having to live with the collateral damage of failed experiments.' - Andy Jassy
	* AWS gives start-ups the above 2 things
* 2003: Chris Pinkham & Benjamin Black present a paper on what Amazon's own internal infrastructure should look like
* 2004: Amazon launches SQS
* 2006: AWS officially launched
* 2007: over 180,000 developers on the platform
* 2010: all of amazon.com moves to AWS
* 2012: First Re:Invent conference
* 2013: Certifications Launched

## Overview
* Traditional Data center challenges
	* Server sprawl(space)
	* Cooling
	* Power
* Cloud service categories
    * IaaS - Infrastructure as a Service
    	* Parts or all of the infrastructure is provided by a 3rd party
        * Provide basic building blocks: hardware, computer, storage
        * Very flexible
        * e.g. EC2
        	* EC2 users do not own the physical servers; AWS provides virtual servers
    * PaaS - Platform (AWS) as a Service - service-oriented architecture
    	* Cloud vendor provides IaaS + Operating System
        * enable users to run applications without the need to manage underlying infrastructure
        * think of it as an API - don’t need to know how it’s implemented
        * e.g. S3
    * SaaS: provide completed product e.g. Gmail, Office 365
    * DaaS: Desktop as a Service
* Cloud Types
	* Public e.g. AWS
		* No capital cost, pay as customers go
	* Private: owned entirely by private org; run in own (or co-located) data center
		* pros: customizable
		* cons: expensive to build & maintain data centers
	* Hybrid
		* Combination of public and private
* Features
	* Scalability - add resources on-demand for growth
	* Elasticity - growing and shrinking on-demand (speed to transition infrastructure based on traffic)
	* Fault tolerance - resiliency (no single point of failures); ability to self-healing
	* High availability - accessibility
* Benefits
	* Ease of use
		* 4 ways to manage AWS: management console, AWS CLI, SDKs, API
	* flexibility
		* Choose services as needed
    * economies of scale
    	* Pay only for usage
    	* No long-term commitment or upfront charges
    * No need for data center / server maintenance & less cost
    * easy to go global
* Deployment Types: all in cloud, hybrid, on-premises
* Architectural evolution: EC2 → ECS → Lambda (less control; least maintenance effort)
* Cloud computing enables you to stop thinking of the infrastructure as hardware, and instead think of it as software
    * Definition: *on-demand* delivery of IT resources and applications *via the internet*
    * e.g. EC2 - virtual machine
    * reference: https://aws.amazon.com/what-is-cloud-computing/

## Infrastructure Overview
* AWS is the vendor:
    * AWS engineers are responsible to e.g. maintenance, DDos attacks, delays, etc.
    * *Availability*, *fault tolerance*, and *scaling* are handled by AWS
        * e.g. hosting a static website on S3
    * Developers don’t need to worry about actual physical hosts, instead just enjoy the service
* AWS Service Stack
    * AWS Foundation Services
        * Compute
            * EC2 (Elastic Compute Cloud); can combine with Elastic Load Balancing and Auto Scaling
            	* An instance is a virtual server in the AWS cloud
        	* Lambda: serverless
				* AWS manages where the code runs
        	* Autoscaling
        		* 3 types: manual, scheduled, dynamic
        * Networking
            * VPC, Route 53, Elastic Load Balacing, CloudFront
        * Storage
            * S3, EBS, EFS, Glacier
    * AWS Platform services
        * Compute e.g. Lambda
        * Db e.g. DynamoDB, RDS, ElastiCache, Redshift
        * Analytics e.g. Kinesis, EMR
        * App integration e.g. SQS, SNS, SES
        * Development tools e.g. CodeCommit, CodeDeploy, CodePipeline, CodeBuild, X-Ray
    * Applications
        * Virtual Desktops
        * Collaboration and Sharing
* Toolkits: e.g. IDE plugin, Cloud 9
* Management tools: e.g. CloudWatch, CloudTrail 

## Regions/AZs
* AWS Global Infrastructure has several regions around the world
	* Region example: us-west-2
* Each region is a geographical area divided into 2 or more AZs e.g. us-west-2a
* Each AZs has 1 or more data centers
    * AZs are designed for fault isolation (e.g. power failure)
    * Interconnected with other AZs using high-speed private links
* AWS recommends replicating across AZs for resiliency

### Edge Location
* An edge location is where end users access services located at AWS. They are located in most of the major cities around the world and are specifically used by CloudFront (CDN) to distribute content to end user to reduce latency.
	* Edge locations are NOT part of AWS regions
	* There are over 150 edge locations
* Typically used for caching
* datacenter owned by a trusted partner of AWS
* Route53 (Load Balancer), CDN (Cache) are typically on the coast
* e.g. Boston, Dallas, Los Angeles, Toronto

## Networking - AWS Foundation Service
* Networking setup should be the first thing to do after AWS account creation
	* Because a network is needed for AWS account to access any of other resources
* VPC is the basis of all aws networking services
* Direct Connect: connect corp network/infrastructure (e.g. own data center) to AWS environment via VPC
* Route 53: AWS service for DNS (Domain Name Services): domain name -> ip resolution

## Upon AWS Account Creation
* Upon creation of an AWS account, a VPC is created across multiple AZs
* While deploying e.g. an EC2 instance, the instance would reside in one of the AZs covered by the VPC

## Best Practices
* Change components without impacting services
    * e.g. modifying capabilities should not affect consumers
* Use a simple API
    * More complexity → more resistance to change
    * Information hiding
* Treat servers as *stateless*
    * only need to determine if capacity is enough for workload
    * we may eventually replace all EC2 with Lambda (worry less and less about hardwares)
        * EC2 (VM) → ECS (Task) → Lambda (Function)
* Data centers
* Regions / Availability Zones


# AWS Management Console
* Resource groups - allows user to add tags to services to combine into one group
* Stick-pin: Drag service on toolbar for frequent access




# IAM (Identity and Access Management)
* Authentication and authorization for AWS resources
	* Manage users and levels of access
* Free to use; no fee for any usages

## Features
* Granular Permissions
* Identity Federation (e.g. login via Facebook, Linkedin)
	* Compare to Cognito

## Terms
* **Principal** a person or application that uses the AWS account root user, an IAM user, or an IAM role to sign in and make requests to AWS.
* **Identities** the IAM resource objects that are used to identify and group. 
	* You can attach a policy to an IAM identity. These include users, groups, and roles.
* **Entities** the IAM resource objects that AWS uses for authentication
* Root account 
	* created automatically once the AWS account is created
    * have full access to the AWS account (can delete the AWS account as well)
    * can transfer information through route53 to other AWS accounts
* Policies (documents)
    * Components: Effect, Action, Resource
    * Format: JSON
    * Policy Simulator can be used to see potential effect
    - Defines what actions are allowed or denied for specific AWS resources
	- Types
		- managed policies
		- inline policies
	- Structure
		- Effect: Allow / Deny
		- Action: specific APIs to the AWS service
		- Resource: AWS service
* Users
	* Has user name & password associated
	* Default permission for a new user is the ability to log in AWS account, no permissions for resources (Principle of Least Privilege)
	* **Users** can be added to a **Group**
    * AWS account access type
    	* Programmatic access (can use CLI / SDK)
    		* Needs access keys & credentials
    	* AWS Console access
	* Policies can be granted to a specific user
		* e.g. S3 full access policy
	* Problem: key might be compromised
* Groups
	* Collection of AWS users
	* In permission tabs, we can see the **policies** attaching to the group
		* This would allow attaching policies to multiple users at once
* Roles
    * Attaching policy to a role allows one AWS service to access another AWS service within the same account
    * STS - Security Token Services
        * issuing tokens valid for 1 to 36 hours

## MFA
* Can be applied to root / other IAM users

## Permission types
* Identity-based policy (attach to user / role)
* Resource-based policy (has principal field)

## Credentials
* Security: availability, integrity, confidentiality
* Console - username / password
* CLI / SDKs / Query API - access key / secret key
    * .aws/credentials:
        * Storing profiles
        * [default], [test], [prod]
* Good practice: MFA
* SDKs automatically sign all requests with the credentials set up
* Sequence for checking credentials:
	* code
	* environment variables
	* default credential profiles in credential files
	* EC2 instance role

## Best Practices
* Do
	* Upon creating a new AWS account
		* Delete root access keys
		* Activate MFA
		* Create individual IAM users
		* Apply an IAM password policy (password strength & rotation period)
    * Assign policies to roles / users
    * Use credential files
    * Temporary credentials from AWS STS
    * Use IAM roles
* Do *NOT* 
    * use Root Account
    * attach policies to groups (all users would have the policy)
    * store credentials in git / code

# Amazon Cognito
* Acts as a broker that allows authenticated users to access AWS resources
* User Pool Authentication
* Standard attributes MUST be specified during creation of the user pool
    * e.g. address, birthdate, email, family name, etc.
* Can allow sign-in via other platforms such as Facebook, LinkedIn, or Google.






# VPC (Virtual Private Cloud)
* VPC cannot span multiple regions, but it can span in multiple AZs
* VPC allows launching AWS resources into a **logical-isolated virtual network**, which closely resembles a traditional network in data center
	* User has full control on who can access the resources
	* Can make an analogy between facebook and VPC
* The VPC is a virtual network dedicated to your AWS account
* It is also the networking layer for Amazon EC2
	* Upon provisioning/launching an EC2 instance, we would need to specify VPC and subnet for network layer
	* An EC2 instance can only attach to 1 VPC
* A VPC endpoint enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. Instances in your VPC do not require public IP addresses to communicate with resources in the service. Traffic between your VPC and the other service does not leave the Amazon network.

## Subnet
* A subnet is a subsection of a network
	* Includes all computers/hosts in a specific location
	* Analogy: home network is a 'subnet' of the ISP's network
* The machines within the same subnet would have the same IP prefix
* In AWS, a subnet is a range of IP addresses in your VPC. 
	* Subnets **cannot** span multiple AZs; each subnet must reside entirely in one AZ
	* A VPC may have one or more subnets 
	* Multiple subnets can be created in one AZ
	* AWS resources can be launched into a specified subnet.
* When the default VPC is created, a subnet is created in each of the AZs of the default region
* Subnet types
	* Public
		* Able to access the internet via a route table with a IGW rule
	* Private

## VPC CIDR
* When you create a VPC, you must specify a range of IPv4 addresses for the VPC in the form of a Classless Inter-Domain Routing (CIDR) block
    * Internet Protocol version 4 (*IPv4*) is the fourth version of the Internet Protocol (IP)
    * *IPv4 address* is a 32-bit number that uniquely identifies a network interface on a machine
* After specification, all IPs in that VPC would have the prefix of the CIDR
* CIDR
    * https://tools.ietf.org/html/rfc4632
    * a prefix is shown as a 4-octet quantity, just like a traditional IPv4 address or network number, followed by the "/" (slash) character, followed by a decimal value between 0 and 32 that describes the number of significant bits. 
    * e.g. 172.16.0.0/16  the "/16" indicating that the mask to extract the network portion of the prefix is a 32-bit value where the most significant 16 bits are ones and the least significant 16 bits are zeros

## Internet Gateway
* **Simplified definition** A combination of hardware and software that provides your private network with a route to the world outside of the VPC
* **AWS definition** An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between instances in your VPC and the internet. It therefore imposes no availability risks or bandwidth constraints on your network traffic.
* The default VPC has an IGW attached
* Internet <-> IGW <-> Route table <-> subnet <-> EC2 instance
* Upon detaching an IGW, the route table still attaches to the detached IGW; however, the IGW would no longer have access to the Internet
* Only one internet gateway can be attached to a VPC at a time.

## Route Table
* A route table contains a set of rules, called routes, that are used to determine where network traffic is directed.
	* Can be seen as a GPS of the VPC
* Default VPC has a **main** route table

## Networking Security
* Firewall: A type of software that either allows or blocks certain kind of internet traffic to pass through it 

### Network Access Control List (NACL)
* A firewall on subnet level for both inbound & outbound calls
* Used to control access among subnets and between subnet & internet
* Auth is based on rules
	* Rules are evaluated based on rule number from lowest to highest
	* The first rule that would apply to the traffic would be applied immediately (like a group of OR statements)
* Stateless - so NACL would check inbound & outbound separately
* In 'default' NACL (assigned to the default VPC), all outbound/inbound traffic are allowed
* For new NACL, all traffic would be denied by default

### Security Group
* Acts as virtual firewall to one or more instances on the instance/server level
	* Can use multiple security groups for one instance
* Rules are different from NACLs
	* No deny rules available, so if want to deny certain traffic, just don't create related rules (Implicitly deny all traffic)
* E.g. NACL -> building access; security group -> room access

## VPC Peering
* A VPC peering connection is a networking connection between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses
* Functionality
	* 2 VPCs in different AWS regions and under different AWS accounts can share traffic between each other
* Use cases
	* Replicate data to geographically distinct locations for fault-tolerance, disaster recovery and redundancy
* Note
	* The logical networks still use the same common AWS backbone network infrastructure to communitcate
	* Traffic between VPC peers is encrypted by default
	* No transitive peering is allowed. i.e. cannot connect from A to C via B if there is no VPC peering between A and C
		* Can use AWS Transit Gateway instead

# Direct Connect
* A cloud service solution that makes it easy to establish a dedicated network connection from your premises to AWS 
	* via one of AWS Direct Connect locations

## Virtual Private Gateway
* A logical, fully redundant distributed edge routing function that sits at the edge of your VPC
	* Amazon VPC side of a VPN connection
* Is used to connect the AWS cloud with clients' on-premises data center
* VPG vs IGW
	* VPG is for connecting to Internet, whereas VPG is for VPN connection


# Route 53
* Place to configure and manage web domains for websites and applications you host on AWS
* Route53 is not Region-specific
* Functions
	* Domain registration
		* e.g. buy 'www.example.com' for a year
	* DNS service
		* can associate IP address with domain name
			* Steps
				1. Go to 'Route 53'
				1. Navigate to 'Hosted Zone' tab
				1. 'Create Hosted Zone'
			 		* Types: 
						* Public (accessible from the internet)
						* Private zone for VPC
				1. 'Create record set' to map domain name to IP address
	* Traffic routing
		* Sends users to the best endpoint
	* Health check
		* Sends automatic requests to verify if the service is reachable, available, and functional
	* DNS failover - automatically change domain endpoint if system fails
* How long does it takes for hosted zone in Amazon Route53 changes to reflect globally?
	* DNS resolvers can only reflect the changes in cache after TTL has expired, which is 24 hours by default
	* After TTL expires, DNS resolvers would make queries for changes
	* If there are changes, it takes 60s for name servers to save the changes. The changes would propagate simultaneously globally

# CloudFront (It's like a Supermarket)
* Content Delivery Network (CDN) that allows users to cache content at "edge locations" (Points of Presence) located all around the world. 
	* By replication of the data to edge locations at the first time when the user near that edge location accesses the data
	* There is a TTL assigned to the cache (customizable) 
	* Creates an alias in Route 53 which points to the edge locations instead of the origin server

## Origin
* Origin of all files that CDN would distribute
* e.g. S3, EC2, ELB, Route53

## Distribution
* The name given to the CDN which consists of a collection of edge locations
* 2 main types
	* Web - typically for websites
	* RTMP - Used for media streaming

## Benefits
* Allows customers to access the contents more quickly
* Provides additional security (AWS Shield - there is a free version)
	* Protects against DDoS attacks by redirecting the attacks from source server to edge locations
* Low latency and high transfer speeds


# AWS Global Accelerator
* A networking service that sends your user’s traffic through Amazon Web Service’s global network infrastructure
* Improving your internet user performance by up to 60%


# API Gateway
* Authentication
    * can perform some authentication, but still need Cognito
* Creating API
    * pass RESTful resources
* Deploying API
* Caching
* Throttling
* Swagger - open API specification
* Invoking API - generate SDK





# EC2 (Elastic Compute Cloud)
* Instance metadata: programmatically retrieve information from an EC2 instance such as public keys, ip address, and instance id
## Computer Components
* OS: base platform for software to operate
	* e.g. windows, mac, linux
	* In EC2, this is called an AMI (Amazon Machine Image), a package of a pre-configured OS
* CPU: brain - processing of tasks
	* In EC2, it's called an instance (e.g. m5.large, m4.xlarge) 
* Hard drive (could be local or remote): data storage
	* In EC2, this is EBS
		* a storage volume that can be attached to any instance in the same AZ
		* a highly available and reliable storage volume
* RAM (random access memory): short-term memory
	* In EC2, it's still RAM in that instance
* Network card: Internet Access
	* In EC2, this is an IP address
* Firewall: security
	* In EC2, this is a security group
	* The key pair .pem file should be 400 before connecting to an EC2 instance. This is the AWS recommended octal permissions for a .pem file.
* **Instance metadata** data about your instance that you can use to configure or manage the running instance
	* e.g. host name, events, and security groups
* **User data** user specified when launching your instance
	* e.g. specify parameters for configuring your instance, or include a simple script
 
## Use Cases
* Web application
* Web servers
* Video processing
* GPU workloads

## Purchasing options
* On-demand
	* Most flexible
	* Charge by seconds or by hours
* Reserved
	* need to pay for 1 - 3 years
	* Significant price discount
	* types
		* Standard Reserved Instances
		* Scheduled Reserved Instances
* Spot 'bid/auction'
	* only pay and use an instance when the spot price <= the 'bid' price
		* biggest savings; up to 90%
		* spot price fluctuates based on market supply and demand
	* allows AWS to sell the use of **unused instances**
	* could be terminated if the computing capacity is needed by on-demand customers
		* if terminated by AWS, customers would not be charged for a partial hour of existing usage
	* Use case
		* Suitable for clients who need the instances for only a few days in a week and does not care about service interruptions
* Dedicated
	* Most expensive
	* Use case
		* when you have strict server-bound licensing that won't support multi-tenancy or cloud deployments
			* **Multi-tenancy** when multiple customers are running workloads on the same hardware
			* **Single-tenant** when a single customer has dedicated hardware


## Cost
* Depends on 
	* purchase options
	* instance types
		* Database Optimized is not an instance type.
		* Instance types: general purpose, memory optimized, compute optimized, storage optimized, accelerated computing
	* AMI types
	* Region
	* If upfront

## AMI (Amazon Machine Image)
* Template to launch instance, which contains OS + software packages
* Components
	* OS
	* Application Software
	* Launch permissions
	* EBS volume for hardware mappings
* Types
	* Community AMIs
		* Free to use
		* Usually only contains OS
	* AWS Marketplace AMIs
		* Comes with licensed softwares
	* custom AMIs

## EBS
* Hard drive for the instance
* Highly reliable and available
* Persist indefinitely from the life of the instance (i.e. could be persisted even if the instance is terminated)

# ELB 
* Evenly distributes traffic among EC2 instances
* Can be created under EC2 in AWS console
	* We can test the ELB by accessing the ELB's 'DNS name' from a browser
* Types
	* Application load balancer (HTTP(s))
	* Network load balancer (TCP/TLS)
		* For configuring traffic for Internet Gateway, we can create an ELB as an internet-facing load balancer on Internet Gateway attaching to the VPC
* ELB is a foundational component of **high availability** and **fault tolerance**

# Autoscaling
* Definition: automation of process for adding or removing EC2 instances based on traffic demand
* **Autoscaling Group** Logical grouping of EC2 instances for the purpose of scaling
* Autoscaling are triggered by rules (scaling policies)
	* e.g. scale up with CPU utilization is over 80%
* Lower and upper bound for number of instances can be specified
* Benefits
	* includes all benefits from ELB
	* adds scalability and elasticity

# Lambda
* Benefits of Serverless Computing
    * never pay for idle; only pay for compute time
* Lambda
	* will replace EC2 for the most part
	* supported languages: Java, Python, C#, Node.js, Ruby
* Features
    * Bring own code - custom runtimes
    * Flexible use
    * Simple resource model
        * power rating from 128 MB to 3 GB (prices are proportional)
    * Flexible Authorization
    * Monitoring & Logging - CloudWatch
    * Stateless - persist data in external storage
    * Continous scaling
* Other
    * In Lambda’s outbound connections port 25 is blocked - no access to send email 
* Practice
    * do not put lambda in VPC
* Current issues
    * Java lambda cold start issues - hard to lower that into 400ms
        * Impact: P99 could be over 20s - API Gateway time out
        * How did cold start happen?
            * JVM allocation + handler class initialization (Boosted CPU Access could take up to 10s)
                * loaded too many classes
            * Dependency injection not front-loading all necessary classes 
            * Known values not provided leading to auto discovery
            * Reflection & classpath scanning
        * Quick fix: allocates more memory to lambda
    * No GraalVM Native Image
        * GraalVM: virtual machine
* Best practice
    * To lower cold start in Java
        * Remove reflection: use dagger (static DI) instead of spring/guice for dependency injection
        * Put dynamoDb initialization into static init methods
        * Use aws java sdk v2
        * Use AWSXRay to figure out the code segment contributing to the code start
        * Use lambda warmer - wake service up after a period of time
        * Check other reinvent guide: e.g. https://www.youtube.com/watch?v=ddg1u5HLwg8&ab_channel=AWSEvents


# Other Compute Services
## AWS Batch
enables developers, scientists, and engineers to easily and efficiently run hundreds of thousands of batch computing jobs on AWS

## AWS Elastic Beanstalk
* An easy-to-use service for deploying and scaling web applications and services on familiar servers
* Supported languages: Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker
* Supported servers: Apache, Nginx, Passenger, and IIS.

## AWS EKS (Elastic Kubernetes Service)
Gives you the flexibility to start, run, and scale Kubernetes applications in the AWS cloud or on-premises

## Amazon Lightsail
* An inexpensive, easy-to-use, novice-friendly and interactive platform to configure and launch web apps or websites quickly
* Private virtual server






# Storage Overview
* Storage array
	* Used in many data centers
	* Many hard drives / volume
* Evolutions
	* Bulk storage
		* 'Giant hard drive'
		* No access to underlying storage OS
		* e.g. Dropbox, Google Drive, S3
	* Block-based storage
		* Just like storage used with the computer, where the computer would see the volume where OS & applications can be installed 
		* e.g. Amazon EBS - attaches to an EC2 instance
* AWS Options
	* S3
	* EBS (Elastic Block Storage)
		* an example of block storage because it is attachable and detachable.
	* EFS
	* NoSQL
		* DynamoDB
	* Redshift

# S3 (Simple Storage Service)
* A cloud **bulk storage** service, where you can remotely store a large sum of data. (Similar to Google drive & dropbox)
* S3 does not reside in any VPCs; it's a global service
* Features
	* Fast
	* Highly scalable
	* 99.99% availability & 11 9s durability
* Operations
    * list
    * select
        * property selectivity
    * delete
    	* can enable MFA

## Components
* Bucket (folder) name needs to be **globally unique** (because it would create a web address)
* object (file) - unique name in the bucket
	* each object can be from 0kb to 5 TB
    * object key (name), value, metadata, version id
    * logging can be enabled to track object level activities

## Data Consistency
* Read after Write for PUTS of new objects: be able to view directly after upload a new object
* Eventual Consistency for override PUTS and DELETES: updating existing file could take time to propagate the change

## Versioning
* Good backup tool
* After enable versioning, each object has metadata and version Id
	* Can see different versions when clicking into the object
    * versions need different permissions to retrieve
    * Cannot disable; can only suspend
* Make one version public does not make the previous versions public 
* Versioned bucket would not be deleted immediately
	* Deleted object can be retrieved via previous versions 
	* Have the option to perminantly delete all versions at once
* versioned bucket supports object locking


## Use cases
* Content storage
* Backup
* Big data analytics
* Static website hosting
	* Can be used together with CloudFront - content delivery network

## Permissions
* default: only available to owner
* good practice: create policies for access
   * Object Policies
   * Bucket Policies:  specify what actions are allowed or denied for which principals on the bucket that the bucket policy is attached to
* client / server authentication
* Access Control List
* Encryption in Transit (SSL/TLS)
* Encryption at Rest (At hard-drive)
	* Can encrypt in object level & bucket level
	* Server-side (Amazon helps encryption)
		* Server-side Encryption S3 Managed Keys (SSE-S3) stores keys
		* SSE-KMS
		* SSE-C - customers' keys
	* Client-side (Encrypt and then upload) 

## Storage Tiers
* A storage class represents the 'classification' assigned to each object in S3
	* The objects would be classified based on different use cases. e.g. frequency of retrieval, data classification, retention, etc.
* Storage class types 
	* Standard: frequently accessed data
		* 99.99% availability, 99.999999999% (i.e. 11 9s) durability
		* low 
		* stored in multiple devices in multiple facilities; can sustain the loss of 2 facilities concurrently
		* the most expensive storage class
	* Standard-IA: long-lived, not frequently accessed
		* 99.9% availability, 99.999999999% (i.e. 11 9s) durability
		* Can have rapid access when needed 
		* Low storage fee; has retrieval fee
	* One Zone-IA: long-lived, not frequently accessed, non-critical data
	* Intelligent-Tiering 
		* will have limited management fee
		* meant to change storage class based on usage and cost-efficiency
		* Minimum storage duration: 30 days
	* **Glacier** long term storage; archiving
		* Minimum storage duration: 90 days
		* Retrieval timeL within 6 hours; can configure from within minutes to hours
	* **Glacier deep archive** is used to archive data with the intent that it will not be retrieved for long periods
		* Retrieval time: within 12 hours
		* Minimum storage duration: 180 days
* **S3 Lifecycle Policy** helps transition objects to another Amazon S3 storage tier
	* e.g. when xxx days old, move to another tier

## Object Lock
* **WORM model** write once, read many
	* Prevent objects from being deleted or modified for a period of time
* Can be applied to an object or to the whole bucket
* Modes
	* Governance - needs permission to delete/overwrite rules
	* Compilance - even root account cannot delete the object for a fixed retention period
* Legal Holds - can be deleted by any users who have **s3:PutObjectLegalHold** permission
* Glacier Vault Lock
	* Cannot be changed once updated

## CORS (Cross Origin Resource Sharing)
* defines a way for client web applications that are loaded in one domain to interact with resources in a different domain
* Can build rich client-side web applications with Amazon S3 and selectively allow cross-origin access to your Amazon S3 resources

## Cross Account Sharing
* 3 ways
	1. Bucket policy && IAM (Programmatic Access)
	1. Bucket ACL (Programmatic Access)
	1. IAM Role (Programmatic & Console Access)

## Cross Region Replication
* Versionings need to be enabled on both source & destination buckets
* Existing files would not be replicated automatically
* Subsequent updated files would be replicated
* Deleting verions would not be replicated 

## Performance
* **AWS Prefix** path excluding bucket and object
* S3 limit
	* 100 - 200 ms for GET
	* TPS limit: 3500 for PUT/COPY/POST/DELETE, 5500 GET/HEAD per prefix
		* Bounded by KMS limits (encrypt & decrypt) if use SSE-KMS, where uploading & downloading would both contribute to KMS quota
			* KMS TPS limit: 5500 / 10000 / 30000 depending on region
* S3 Select
	* Retrieve only a subset of data from an object with simple SQL expressions
	* Up to 400% performance improvement, up to 80% cheaper
* Glacier Select
	* Run SQL queries against Glacier directly

## Billing aspects
* Storage
* Retrieval
* Storage Management Pricing
* Data Transfer Pricing
* S3 Transfer Acceleration 
	* Fast transfer for long distance (via CloudFront) 
	* Upload to edge location then upload to S3 bucket via backbone network
	* Helps end users reduce upload time (up to 150% speed increase)
* Cross Region Replication
	* Replicate to another region automatically 

## Best Practices
* Do
	* More prefixes (for more TPS limit)
	* Multipart uploads (recommended for object > 100 MB)
    * provide pre-signed urls which grant GET/PUT permissions
    * check message integrity: HTTPS / MD5
    * enable server logging / SDK logging
    * call put first (no charge) instead of get
* Do NOT 
    * retrieve metadata or list very frequently

# AWS DataSync
* Move large amounts of data from data center to AWS
	* Connects to S3, EFS, and Amazon FSx for Windows File Server
	* Can also replicate EFS to another EFS
* Replication can be done hourly, daily, and weekly
* Used with NFS/SMB compatible file systems
* Provides encryption in transit & at rest, data integration check

# Database Migration Service
* helps migrate databases to AWS quickly and securely
* The source database remains fully operational during the migration, minimizing downtime to applications that rely on the database
* Can migrate your data both to and from most of the widely used commercial and open-source databases.

# Storage Gateway
* Hybrid storage service for organizations who have stored data split between a local data center and the AWS cloud.
* Migration service to help clients onboard their current storage to AWS storage
* Deployment types
	* File gateway
		* e.g. S3 uploading
		* NFS
	* Volume gateway
		* 2 ways 
			* stored volumes - for Backup
				* Keep the data locally in clients, and back up the data in AWS clouds 
			* cached volumes - fast access & store in cloud
				* Create cache locally in clients, and store data in AWS clouds
	* Tape gateway
		* Long-term, off-site archiving
		* VTL (Virtual tape library) is more reliable than tape


# RDS (Relational Database Service)
* Relational database (SQL) service that provide a number of SQL database options
	* reside in VPC
	* AWS maintains the underlying OS and performs software patching on the database.
* Benefits
	* low cost
	* no hardware provisioning
	* scalability
	* high availability
* Capacity types
	* Serverless
	* Provisioned

## Options
* Amazon Aurora
* MySQL
* MariaDB
* PostgreSQL
* Oracle (several options)
* Microsoft SQL Server (several options)

### Amazon Aurora (Based on MySQL)
* A MySQL and PostgreSQL-compatible relational database built for the cloud
* Serverless platform; fully managed by RDS
* up to 5 times faster than standard MySQL databases and 3 times faster than standard PostgreSQL databases.
* Cost: 1/10 of commercial databases

# Dynamodb
* Non-relational Database (NoSQL)
* Replacement of Oracle NoSQL, Cassandra DB, and MongoDB; Amazon DynamoDB does not allow for alternative NoSQL database software options.
* Features
    * Fully managed
    * Serverless
    * Consistent read / write
    * Stores data as a JSON-like document instead of an entry
* Keys
    * Partition key (primary key - identifier of an item)
        * spread table into partitions (each partition should be well distributed)
    * sort key (optional, if specified then this is part of primary key)
        * should set to one of the most frequently searched attribute
* Pricing
    * If pay upfront - cheaper read/write later e.g. costco
* Throughput
    * divided evenly among partitions
* GSI (Global Secondary Index)
* Change Data Capture
* Global Tables
    * Create local tables, enable stream, and setup global table (abstraction - no actual table, only metadata) on top
    * data will eventually be consistent
    * Conflict: last write wins


# ElasticCache
* A data caching service used to help improve speed/performance of web applications running on AWS
* Cache in memory
* Supported open-source in-memory engines
	* **Redis** A fast, open source, in-memory data store and cache
	* **Memcached** A common memory object caching system

# Amazon Neptune
A fast, reliable, fully-managed graph database service that makes it easy to build and run applications that work with highly connected datasets

# Amazon Redshift
* Fast, fully managed Cloud Data Warehouse
* Architecture
    * A relational *database* management system (RDBMS) based on an older version of PostgreSQL 8.0.2
        * RDBMS
        * PostgreSQL
    * S3 vs. RedShift
        * Amazon S3 a simple web services interface to store and retrieve any amount of data from anywhere on the web
        * data can be pumped into your warehouse from s3
* Features
    * can query against up to 1 PB (1024 TB) stored in RedShift, and 1 EB (1024 PB) in S3
    * gives you fast querying capabilities over structured data using familiar SQL-based clients and business intelligence (BI) tools using standard ODBC and JDBC connections. Queries are distributed and parallelized across multiple physical resources.
* Use cases
	* best suited for analyzing data using standard SQL and Business Intelligence(BI) tools
* Definitions
    * Data warehouse is a collection of computing resources (*nodes*)
    * *Nodes* are organized into a group called a *cluster*
    * Each *cluster* runs an Amazon Redshift engine and contains one or more databases
    * Named as *RedShift* as it’s the same as the context of Universe Expansion as observed in Hubble's telescope
* Technologies
    * columnar data store (also called a column-oriented database)
    * massively parallel processing (MPP)
* Usage
    * Can setup SQL Workbench with JDBC
    * There is limited dynamic statement available for RedShift, using python might be better


# Amazon EFS (Elastic File System)
* A regional service storing data within and across multiple AZs
	* Can access file systems across AZs and regions
* Can also share files between thousands of Amazon EC2 instances and on-premises servers via Direct Connect / AWS VPN
* High availability and durability

# Amazon FSx for Lustre
A fully managed file system that is optimized for compute-intensive workloads, such as high performance computing, machine learning, etc

# Amazon FSx for Windows File Server
A fully managed native Microsoft Windows file system so you can easily move your Windows-based applications that require file storage to AWS




# Application Integration Services
* Consumer-Producer
    * Synchronous process wastes resources & does not tolerate failure very well
    * Asynchronous process - can read / write any time

## AWS Step Functions
### Why Need step functions

In serverless application, creating one function might not be enough, then we need to implement more and more functions. There are different ways to combine those functions, e.g. chaining; however, what if one function fails? Thus we need mechanism to combine different Lambda functions.

* Step functions 
* Control logic
    * Pass
    * Choice (just like a switch statement)
    * Parallel
    * Wait
        * waiting for a signal
* Starting state machines
    * Call startExecution API
* Use case
    * Collaboration among two or more AWS services via different Lambda functions
    * Parallelize upon waiting for results from one AWS service

### Terminologies
* State machine - workflow template
* Execution - specific workflow based on template


## SQS
* Can send, store, and receive messages between software components at any volume, without losing messages or requiring other services to be available
* Pay only for transactions, but no fee for storage
    * Message max retention: 14 days
    * Max message size: 256 kb
* Standard queue
    * could have duplicate - messages might be partially processed by one then go back to the queue (depends on Visibility Timeout)
* FIFO queue
    * serialized; slower
    * guaranteed one delivery to one consumer
* Polling messages
    * Short polling 
        * Good for single threaded application
    * Long polling
        * Get full set of messages across all servers
* Since last year, SQS can start to trigger lambda functions


## SNS
* SNS is used to automate emails and SMS messages triggered by events taking place in an AWS account.
* Features
	* PubSub pattern
	* Push model
    * Each message contains a single published message
    * Order not guaranteed
    * Could retry after message delivery failure
* Delivery methods
	* SMS
	* Email
	* HTTP
* Endpoint
	* A webserver, email address, Amazon SQS queue, SMS, and AWS Lambda function can all be endpoints to an SNS topic
* Message size limit: 256 KB
* Access control
    * Permissions in different endpoints for different kinds of subscriptions (SQS, Email, Mobile, SMS)
    * Permissions for publisher and subscriber
* Use cases
	* relay time-critical events to mobile applications and devices

## Amazon MQ
A managed message broker service for Apache ActiveMQ and RabbitMQ that makes it easy to set up and operate message brokers on AWS

## SES
A cost-effective, flexible, and scalable email service that enables developers to send mail from within any application




# Management Services

## AWS Systems Manager
* Provides a unified user interface so you can view operational data from multiple AWS services and allows you to automate operational tasks across your AWS resources
* Can group resources together
	* e.g. EC2, EKS clusters, S3 buckets, RDS instances, etc.

## CloudWatch
* Manages logs, metrics & alarms
	* Can also create billing alarms under 'Alarms' -> 'Billing' and add SNS to send emails on alarms
* By default, CloudWatch analyzes AWS resources for metrics every 5 minutes for free.
* Provides you with data and actionable insights to monitor your applications

### CloudWatch Agent on EC2
1. Configure IAM role to allow SSM (AWS System Manager) to install and configure CloudWatch agents on EC2
1. The configuration can then be saved to the *parameter store* in SSM
1. SSM can then apply the same configuration to other instances

## CloudTrail
* CloudTrail is a service that allows for auditing of IAM users within in AWS account.
* Mainly for security analysis, troubleshooting, and resource change tracking
* Can monitor specific activities in S3 or Lambda

## X-Ray
* Helps developers analyze and debug production, distributed applications
* Can help understand how your application and its underlying services are performing to identify and troubleshoot the root cause of performance issues and errors
	* Can be used to trace user requests from end-to-end through the application

## AWS Service Catalog
* Allows organizations to create and manage catalogs of IT services that are approved for use on AWS
	* Catalogs can be multi-tiered application architectures
* Allows centrally manage deployed IT services and your applications, resources, and metadata
* Use cases
	* Control permissions for different group of users to access certain parts of some AWS application stacks
* How it works?
	* Admin can create Portfolios from products (application stacks) using AWS CFN templates
	* Admin can then apply permissions and constraints for IAM users and user groups to enable access to the products

## AWS Directory Service (AWS Directory Service for Microsoft Active Directory, aka AWS Managed Microsoft AD)
* Enables directory-aware workloads and AWS resources to use managed Active Directory in the AWS Cloud
* An AWS Tool providing ways to use Amazon Cloud Directory and Microsoft Active Directory with other AWS services




# Developer Tools

## Cloud9
* AWS service for providing an IDE to run, test and debug code
* Serverless

## CodeStar
* Cloud-based service for creating, managing, and working with software development projects on AWS

## CodeBuild
* a fully managed continuous integration service that compiles source code, runs tests, and produces software packages that are ready to deploy
* eliminates the need to set up, patch, update, and manage your own build servers and software. There is no software to install or manage.

## CodeCommit
* A fully-managed source control service that hosts secure Git-based repositories
* Eliminates the need to operate your own source control system or worry about scaling its infrastructure
* Can securely store anything from source code to binaries

## CodeDeploy
A fully managed deployment service that automates software deployments to a variety of compute services such as Amazon EC2, AWS Fargate, AWS Lambda, and your on-premises servers.

## CloudFormation
Provides a common language for you to model and provision AWS and third-party application resources in your cloud environment


## CloudPipeline
Can help orchestrate and automate the various phases involved in the release of application updates in-line with a predefined release model.

## AWS SAM
* Template driven Extension on CloudFormation
* Helps debugging Lambda functions



# CDK
* What’s CDK
    * A software development framework for defining cloud infrastructure in code and provisioning it through AWS CloudFormation.
    * Languages
        * TypeScript (most supported), JS, Py, Java, C#
* Features
    * Create and provision AWS infrastructure deployments predictably and repeatedly.
    * Leverage AWS products such as Amazon EC2, Amazon Elastic Block Store, Amazon SNS, Elastic Load Balancing, and Auto Scaling.
    * No need to worry about creating and configuring the underlying AWS infrastructure.
    * Use a template file to create and delete a collection of resources together as a single unit (a *stack*).
* Concepts
    * Bucket
        *  Like all constructs, the Bucket class takes three parameters.
        * *scope:* Tells the bucket that the stack is its parent: it is defined within the scope of the stack. You can define constructs inside of constructs, creating a hierarchy (tree).
        * *Id:* The logical ID of the Bucket within your AWS CDK app. This (plus a hash based on the bucket's location within the stack) uniquely identifies the bucket across deployments so the AWS CDK can update it if you change how it's defined in your app. Buckets can also have a name, which is separate from this ID (it's the bucketName property).
        * *props:* A bundle of values that define properties of the bucket. Here we've defined only one property: versioned, which enables versioning for the files in the bucket.
* Why CDK instead of cloudformation
    * Higher level abstraction 
        * e.g. use 5 lines of CDK to do 100 lines of cloudFormation
    * CDK does not have steep learning curve than cloudformation
    * IDE integration
        * e.g. syntax check
* Commands
    * cdk synth
        * executes your app, which causes the resources defined in it to be translated to an AWS CloudFormation template. The output of cdk synth is a YAML-format AWS CloudFormation template
    * cdk deploy
        * 
* Demo
    * Create CDK project: cdk init --language typescript




# AWS Security & Complience 
## AWS Shared Responsibility Model
* AWS is responsible for hardware layer, infrastructure, and basic softwares
* Clients are responsible for
	* Network-level security (NACLs & Security Group)
	* IAM
	* OS patches & updates
	* Client & server side encryption

## Client Penetration Testing
* Penetration testing can be done to some of the AWS services without prior approvals, e.g.
	* Network
		* API Gateway
		* CloudFront
		* NAT gateways
	* Compute
		* EC2 instances, ELB
		* Lightsail
		* Elastic Beanstalk
		* Lambda
	* Storage
		* RDS
			* Aurora
* Penetration testing which needs approval
	* S3
	* Route 53
* Prohibited activities
	* DNS Zone walking via Amazon Route 53 hosted zones
	* Port flooding
	* DDoS attacks

## AWS Security Services
### AWS Artifact
* A comprehensive resource center to have access to the AWS' auditor-issued reports & security and compliance documentation from several renowned independent standard organizations
	* free to use
	* to prove AWS meets a compliance based on global compliance frameworks
* Users can also get online service agreements between orgs and AWS 

### Amazon GuardDuty
* threat detection service 
* continously monitor and protect AWS accounts

### Amazon Inspector (Policy Engine)
* An automated security assessment service that helps improve the security and compliance of applications deployed on AWS
	* Assess exposure, vulnerabilities, and deviations from best practices
	* Produces a detailed list of security findings prioritized by the level of severity
* Can audit a single EC2 instance that you've selected and generate a report form a long list of security checks


### AWS WAF (Web Application Firewall)
* A web application firewall that helps protect your web applications or APIs against common web exploits that may affect availability, compromise security, or consume excessive resources
* WAF includes AWS Shield

### AWS Shield - mentioned in route 53
* A managed DDoS protection service that safeguards applications running on AWS
* Protect you against Layer 3, 4, and 7 attacks
* Free to use, but there are additional services at extra cost

### Amazon Macie
A fully managed data security and data privacy service that uses machine learning and pattern matching to discover and protect your sensitive data in AWS.


## AWS KMS (Key Management Service)
* Service for creating and managing keys
* Key may be generated in KMS
	* can also be generated in CloudHSM
* Can integrate with a number of AWS services and provide keys
	* S3 would be the service in which KMS could encrypt an object.
	* Integrates with CloudTrail to log KMS key events.

## CloudHSM
A cloud-based hardware security module (HSM) that enables you to easily generate and use your own encryption keys on the AWS Cloud




# AWS Analytics
## Athena
* Serverless interactive query service

## EMR (Elastic Map Reduce)
* Managed Hadoop framework

## CloudSearch
Service to help set up, manage, and scale a search solution for the website and application

## Elasticsearch
Help deploy, secure, operate, and scale Elasticsearch to search, analyze, and visualize data in real-time

## Kinesis
Help collect, process, and analyze real-time, streaming data so you can get timely insights and react quickly to new information

## Kinesis Data Firehose
* reliably load streaming data into data stores and analytics tools
* can capture, transform, and load streaming data into Amazon S3, Amazon Redshift, Amazon Elasticsearch Service, and Splunk

## Kinesis Data Analytics
analyze streaming data, gain actionable insights, and respond to your business and customer needs in real time

## Kinesis Data Streams
A massively scalable and durable real-time data streaming service

## AWS QuickSight
A scalable, serverless, embeddable, machine learning-powered business intelligence (BI) service built for the cloud

## AWS Glue
* A serverless data integration service that makes it easy to discover, prepare, and combine data for analytics, machine learning, and application development
* can visually create, run, and monitor ETL workflows with a few clicks in AWS Glue Studio




# Other AWS Services
## AWS Quick Start
* Templates to start AWS developments


## Amazon Rekognition
* Video/image analysis
* can identify objects / people


## Amazon Mechanical Turk
* Crowdsourcing marketplace for outsourcing

## AWS Data Pipeline
* A web service that helps you reliably process and move data between different AWS compute and storage services, as well as on-premises data sources, at specified intervals.

## AWS Snowball
* A petabyte-scale data transport solution that uses secure appliances to transfer large amounts of data into and out of the AWS cloud
* Addressed challenges including
	* high network costs
	* long transfer times
	* security concerns

## AWS Marketplace
* A digital catalog with thousands of software listings from independent software vendors that make it easy to find, test, buy, and deploy software that runs on AWS.
* Products
	* AMI
	* CDN templates
	* Web ACL
	* AWS WAF rules

## AWS Config
* used to audit and monitor configuration changes
* continuously monitors and records your AWS resource configurations and allows you to automate the evaluation of recorded configurations against desired configurations




# Billing
## AWS Organizations
* Can manage policies from a master AWS account to other accounts for security and compliance purposes.
* Allows managing billing for multiple AWS accounts
	* Consolidated billing - one bill for all accounts
* Organization Units (OU) i.e. department specified in AWS cloud
* Free to all AWS customers
* Can enjoy pricing benefits from aggregated usage (volume discounts)

### Service Control Policies
* A type of organization policy that you can use to manage permissions in your organization
* SCPs offer central control over the maximum available permissions for all accounts in your organization

### Best Practice
* Create root account for billing only and sub AWS accounts under OUs for other cloud services
	* with strong password & MFA
* Enable / disable services using SCP either on OU or on AWS accounts

## AWS Pricing Models
* Pay-as-you-go
* Save when reserve instances
	* RDS & EC2 can be purchased at a bulk discounted rate for a term for reserved instances.
* No termination fees, no need for upfront payments
* May have volume discounts & upfront discounts

## Free Tier
* Periods: trial, 12 months free, always free

## TCO (Total Cost of Ownership) Calculator
* Free tool to estimate cost savings to use AWS vs. a data center

## Pricing Calculator
* Replacement of AWS Simple Calculator
* Estimates cost of each AWS services in a particular month

## Cost Explorer
* Free tool to check actual charges on the AWS services 
* Shows 13 months (current + past 12 months) of billing history information
	* Also provides trends to understand cost
	* Identify (cost) problem areas for further inquiry
* Provides forecast information for the next 12 months
	* Can customize

## AWS Cost and Usage Reports (AWS Reports)
* Contain the most comprehensive set of cost and usage data available
	* Reports would be delivered to S3
* Can receive hourly, daily or monthly reports that break out your costs by product or resource and by tags that you define yourself
* AWS updates the report in your bucket at least once per day (up to 3 times per day)
* No forecasts

## AWS Billing Service
* Shows not only the bills, but also the free tier usages
* Under preferences, we can set up **alerts** about free tier usages
* No forecasts

## AWS Budgets
* plan your service usage, service costs and instance reservations
* First 2 budgets are free

## Cost Allocation Tags
* A tag is a label that you or AWS assigns to an AWS resource
* Tags are managed in **Resource Groups**
* Cost allocation tags can track your AWS costs on a detailed level
	* AWS uses the cost allocation tags to organize your resource costs on your cost allocation report to make it easier for you to categorize and track your AWS costs
* Types
	* AWS generated
		* AWS defines, creates, and applies the AWS generated tags for you
	* custom


# AWS Support
## AWS Support Plans
* Basic
	* have access to AWS Trusted Advisor, Personal health dashboard
* Developer 
	* $29 per month
	* 1 PoC
	* No 3rd party support
	* have email access to Cloud Support Associates during business hours
	* general guidance < 24 hours response time support 
	* system impaired < 12 hours
* Business
	* starts $100 per month
	* starts having 24/7 access to Cloud Support Engineers via phone, email, and chat
	* production system impaired < 4 hours
	* production system down < 1 hour 
* Enterprise
	* starts with $10,000 per month
	* receives support in less than 15 minutes when the support care is related to business-critical systems down

## AWS Trusted Advisor
* An online tool that provides you real-time guidance to help you provision your resources following AWS best practices
* Benefits
	* optimize your AWS infrastructure
	* increase security and performance
		* MFA, key rotation
		* utilization
	* reduce your overall costs
		* idle/unused resources
	* monitor service limits
	* fault tolerance
		* backup
* Basic & Developer Support Plans get access to 6 security checks, while Business and Enterprise get access to all 115 Trusted Advisor checks
* There is no AWS service called AWS Optimizations

### AWS Personal Health Dashboard
* provides alerts and remediation guidance when AWS is experiencing events that may impact you
* gives a personalized view into the performance and availability of the AWS services underlying the AWS resources

## Actions upon an AWS account is compromised
* respond to notifications from AWS in the AWS Support Center
* change the password for all IAM users 
* delete any suspicious resources
* change the root password
* rotate and delete all API access keys

## AWS Resource Center
A repository of tutorials, whitepapers, digital training, and project use cases




# Whitepaper: 5 pillars of the AWS Well Architected Framework (**PRC OS**)
## Operational Excellence
* The ability to support development and run workloads effectively, gain insight into their operations, and to continuously improve supporting processes and procedures to deliver business value.
* Do
	* Perform operations in code - implement your operations procedures as code and automate their execution by triggering them in response to events
		* e.g. automate stress test, integration test & unit test running
	* Make frequent, small, reversible changes
	* Refine operations procedures frequently
	* Anticipate failure
		* Perform “pre-mortem” exercises to identify potential sources of failure so that they can be removed or mitigated
	* Learn from all operational failures

## Security
* Protects data, systems, and assets to take advantage of cloud technologies to improve your security
* Do
	* Implement a strong identity foundation
		* principle of least privilege
		* enforce separation of duties
	* Enable traceability
		* Monitor, alert, and audit actions and changes to your environment in real time
		* Tools: CloudTrail, CloudWatch, X-Ray
	* Apply security at all layers
	* Automate security best practices
	* filter unwanted traffic at VPC-edge rather than on the hosts

## Performance Efficiency
* Focus on the use of collected data, computing resources and performance metrics to accurately meet system requirements
* Do
	* Democratize advanced technologies
		* Delegate tasks to cloud vendor
	* Go global in minutes (by deploying to multiple regions)
	* Serverless architecture


## Reliability
* Able to perform function correctly and consistently
* Do
	* Automatically recover from failure
	* Test recovery procedures
	* Scale horizontally to increase aggregate workload availability
		* Reduce the impact of a single failure
	* Manage change in automation
		* e.g. Autoscaling

## Cost Optimization
* Implement Cloud Financial Management




# Mock Exams Review
## Cloud Concepts
* AWS Service Health Dashboard
	* displays the general status of AWS services
	* up-to-minutes
* Amazon Workspaces
	* DaaS
	* provision either Windows or Linux desktops in just a few minutes
* Vertical scaling
	* Increasing the size and computing power of a single instance or node without increasing the number of nodes or instances.
* Horizontal scaling
	* Provisioning additional servers to meet your needs
* Is IAM a global AWS service? Yes

### Cloud Best Practices
* Design for failure
* Loose coupling
* Think Parallel
* Implement 'Elasticity'
* Build security in every layer
* Don't fear constraints
* Leverage different storage options

## Security & Compliance
* Resource Groups
	* Organize your AWS resources
		* e.g. Can manage a large number of S3 buckets and automate tasks on these buckets at one time
	* Can add and manage custom tags on AWS resources

## Billing & Pricing
### EC2 Instance Types
* Standard Reserved Instances
	* significant discount (up to 72%) compared to On-Demand Instance pricing
	* can be purchased for a 1-year or 3-year term.
	* Customers have the flexibility to change the AZ, the instance size (e.g. m5.large -> m5.xlarge), and networking type (e.g. Enhanced Networking) of the instances
* Scheduled Reserved Instances
	* purchase capacity reservations that recur on a daily, weekly, or monthly basis, with a specified start time and duration, for a 1-year term
* Convertible Reserved Instances
	* Can exchange instance family, instance type, platform (e.g. from windows to linux), scope, or tenancy for a 1-year term
* Dedicated Host
	* Provide the option to bring along existing software licenses


# Certification Exam
## Purpose
Strongly correlate certification with real-world performance

## Format
Multiple questions

## Exam Stucture
* Exam questions have lifecycle
* New questions may arise due to AWS service update
	* They would be from a different pool of questions
	* Each exam may have 5 new questions
	* They are not scored (don't assume any question is unscored)
	* Questions are added/updated slowly (could take months / years)
* Check forums may be a good idea to stay up-to-date on topics

## Exam Readiness
* Measures
	* Self-confidence
	* Practice exam
	* Forum topics familiarity
	* Check exam blueprint

## Re-certification
* Certificates expire in 3 years.
* Recertification testing would be half price and shorter
* Passing Pro level would renew Associate level certificates
