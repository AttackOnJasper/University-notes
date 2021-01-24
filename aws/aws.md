# AWS

## AWS Cloud
### Architecture Evolution
* Traditional Client-Server Architecture
	* Enable multiple distributed systems connecting together
* Evolution: Cloud
	* e.g. Instead of storing stuff in PC, we store in e.g. Google Drive, Dropbox, etc.
* Cloud Basic Components
	* Compute - i.e. CPU + RAM (ability for processing)
	* Storage - database
	* Network - communication means

### Overview
* Traditional Data center challenges
	* Server sprawl(space)
	* Cooling
	* Power
* Cloud service categories
    * IaaS - Infrastructure as a Service
    	* Parts or all of the infrastructure is provided by a 3rd party
        * Provide basic building blocks: hardware, computer, storage
    * PaaS - Platform (AWS) as a Service - service-oriented architecture
    	* PaaS: IaaS + Operating System
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
* Deployment Types (all in cloud / hybrid)
* Architectural evolution: EC2 → ECS → Lambda (less control; least maintenance effort)
* Cloud computing enables you to stop thinking of the infrastructure as hardware, and instead think of it as software
    * Definition: *on-demand* delivery of IT resources and applications *via the internet*
    * e.g. EC2 - virtual machine
    * reference: https://aws.amazon.com/what-is-cloud-computing/

### Infrastructure Overview
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

### Regions/AZs
* AWS Global Infrastructure has several regions around the world
	* Region example: us-west-2
* Each region has 2 or more AZs e.g. us-west-2a
* Each AZs has 1 or more data centers
    * AZs are designed for fault isolation (e.g. power failure)
    * Interconnected with other AZs using high-speed private links
* AWS recommends replicating across AZs for resiliency
* Route53 (Load Balancer), CDN (Cache) are typically on the coast

### Networking - AWS Foundation Service
* Networking setup should be the first thing to do after AWS account creation
	* Because a network is needed for AWS account to access any of other resources
* VPC is the basis of all aws networking services
* Direct Connect: connect corp network/infrastructure (e.g. own data center) to AWS environment via VPC
* Route 53: AWS service for DNS (Domain Name Services): domain name -> ip resolution

### Upon AWS Account Creation
* Upon creation of an AWS account, a VPC is created across multiple AZs
* While deploying e.g. an EC2 instance, the instance would reside in one of the AZs covered by the VPC

### Best Practices
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



## AWS Management Console
* Resource groups - allows user to add tags to services to combine into one group
* Stick-pin: Drag service on toolbar for frequent access




##IAM (Identity and Access Management)
* Features
    * Authentication and authorization for AWS resources
    * Free to use; no fee for any usages

### Permission types
* Root account 
	* created automatically once the AWS account is created
    * have full access to the AWS account (can delete the AWS account as well)
    * can transfer information through route53 to other AWS accounts
* Policies
    * Components: Effect, Action, Resource
    * Policy Simulator can be used to see potential effect
* IAM Users
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
    * Like a user, but no password or keys
    * Attaching policy to a role allows one AWS service to access another AWS service within the same account
    * STS - Security Token Services
        * issuing tokens valid for 1 to 36 hours

### MFA
* Can be applied to root / other IAM users

### Policies
- Defines what actions are allowed or denied for specific AWS resources
- Types
	- managed policies
	- inline policies
- Structure
	- Effect: Allow / Deny
	- Action: specific APIs to the AWS service
	- Resource: AWS service

### Permission types
* Identity-based policy (attach to user / role)
* Resource-based policy (has principal field)

### Credentials
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

### Best Practices
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





## VPC (Virtual Private Cloud)
* VPC cannot span multiple regions
* VPC allows launching AWS resources into a **logical-isolated virtual network**, which closely resembles a traditional network in data center
	* User has full control on who can access the resources
	* Can make an analogy between facebook and VPC
* The VPC is a virtual network dedicated to your AWS account
* It is also the networking layer for Amazon EC2
	* Upon provisioning/launching an EC2 instance, we would need to specify VPC and subnet for network layer
	* An EC2 instance can only attach to 1 VPC
* A VPC endpoint enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. Instances in your VPC do not require public IP addresses to communicate with resources in the service. Traffic between your VPC and the other service does not leave the Amazon network.

### Subnet
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

### VPC CIDR
* When you create a VPC, you must specify a range of IPv4 addresses for the VPC in the form of a Classless Inter-Domain Routing (CIDR) block
    * Internet Protocol version 4 (*IPv4*) is the fourth version of the Internet Protocol (IP)
    * *IPv4 address* is a 32-bit number that uniquely identifies a network interface on a machine
* After specification, all IPs in that VPC would have the prefix of the CIDR
* CIDR
    * https://tools.ietf.org/html/rfc4632
    * a prefix is shown as a 4-octet quantity, just like a traditional IPv4 address or network number, followed by the "/" (slash) character, followed by a decimal value between 0 and 32 that describes the number of significant bits. 
    * e.g. 172.16.0.0/16  the "/16" indicating that the mask to extract the network portion of the prefix is a 32-bit value where the most significant 16 bits are ones and the least significant 16 bits are zeros

### Internet Gateway
* **Simplified definition** A combination of hardware and software that provides your private network with a route to the world outside of the VPC
* **AWS definition** An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between instances in your VPC and the internet. It therefore imposes no availability risks or bandwidth constraints on your network traffic.
* The default VPC has an IGW attached
* Internet <-> IGW <-> Route table <-> subnet <-> EC2 instance
* Upon detaching an IGW, the route table still attaches to the detached IGW; however, the IGW would no longer have access to the Internet
* Only one internet gateway can be attached to a VPC at a time.

### Route Table
* A route table contains a set of rules, called routes, that are used to determine where network traffic is directed.
	* Can be seen as a GPS of the VPC
* Default VPC has a **main** route table

### Networking Security
* Firewall: A type of software that either allows or blocks certain kind of internet traffic to pass through it 
* Network Access Control List (NACL)
	* A firewall on subnet level for both inbound & outbound calls
	* Used to control access among subnets and between subnet & internet
	* Auth is based on rules
		* Rules are evaluated based on rule number from lowest to highest
		* The first rule that would apply to the traffic would be applied immediately (like a group of OR statements)
	* Stateless - so NACL would check inbound & outbound separately
	* In 'default' NACL (assigned to the default VPC), all outbound/inbound traffic are allowed
	* For new NACL, all traffic would be denied by default
* Security Group
	* A firewall on the instance/server level
* E.g. NACL -> building access; security group -> room access

### VPC Peering


## Direct Connect
* Setup private connection from own data center to AWS





## EC2 (Elastic Compute Cloud)
### Computer Components
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

### Use Cases
* Web application
* Web servers
* Video processing
* GPU workloads

### Purchasing options
* On-demand
	* Most expensive
	* Most flexible
* Reserved
	* need to pay for 1 - 3 years
	* Significant price discount
	* types
		* Standard Reserved Instances
		* Scheduled Reserved Instances
* Spot 'bid/auction'
	* only pay and use an instance when the spot price <= the 'bid' price
	* allows AWS to sell the use of **unused instances**
	* spot price fluctuates based on market supply and demand

### Cost
* Depends on 
	* purchase options
	* instance types
		* Database Optimized is not an instance type.
		* Instance types: general purpose, memory optimized, compute optimized, storage optimized, accelerated computing
	* AMI types
	* Region

### AMI (Amazon Machine Image)
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
	* own AMIs

### EBS
* Hard drive for the instance
* Highly reliable and available
* Persist indefinitely from the life of the instance (i.e. could be persisted even if the instance is terminated)

### Security Group
* Acts as virtual firewall to one or more instances
* Can use multiple security groups for one instance
* Rules are different from NACLs
	* No deny rules available, so if want to deny certain traffic, just don't create related rules




## Storage Overview
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

## S3 (Simple Storage Service)
* A cloud **bulk storage** service, where you can remotely store a large sum of data. (Similar to Google drive & dropbox)
* S3 does not reside in any VPCs
* Features
	* Fast
	* Highly scalable
* Operations
    * list
    * select
        * property selectivity

###Components
* Bucket (folder) name needs to be **globally unique**
* object (file) - unique name in the bucket
    * object key, metadata, version
    * logging can be enabled to track object level activities

### Versioning
* After enable versioning, each object has metadata and version Id
	* Can see different versions when clicking into the object
    * versions need different permissions to retrieve
* versioned bucket supports object locking (would not be deleted)

### Use cases
* Content storage
* Backup
* Big data analytics
* Static website hosting
	* Can be used together with CloudFront - content delivery network

### Permissions
* default: only available to owner
* good practice: create policies for access
* public bucket use case: static websites hosting
* client / server authentication
* CORS (cross origin resource sharing)

### Storage Classes
* A storage class represents the 'classification' assigned to each object in S3
	* The objects would be classified based on different use cases. e.g. frequency of retrieval, data classification, retention, etc.
* Storage class types 
	* Standard: frequently accessed data
		* 99.99% availability, 99.999999999% (i.e. 11 9s) durability
		* low latency
		* the most expensive storage class
	* Standard-IA: long-lived, not frequently accessed
		* 99.39% availability, 99.999999999% (i.e. 11 9s) durability
	* One Zone-IA: long-lived, not frequently accessed, non-critical data
	* Intelligent-Tiering 
		* will have limited management fee
		* meant to change storage class based on usage and cost-efficiency
		* Minimum storage duration: 30 days
	* **Glacier** long term storage
		* Minimum storage duration: 90 days
	* **Glacier deep archive** is used to archive data with the intent that it will not be retrieved for long periods
		* Retrieval time: within 12 hours
		* Minimum storage duration: 180 days

### Best Practices
* Do
    * provide pre-signed urls which grant GET/PUT permissions
    * check message integrity: HTTPS / MD5
    * enable server logging / SDK logging
    * call put first (no charge) instead of get
* Do NOT 
    * retrieve metadata or list very frequently


## Storage Gateway
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


## RDS (Relational Database Service)
* Relational database (SQL) service that provide a number of SQL database options
	* reside in VPC
* Options
	* Amazon Aurora (Based on MySQL)
		* Serverless platform
	* MySQL
	* MariaDB
	* PostgreSQL
	* Oracle (several options)
	* Microsoft SQL Server (several options)
* Benefits
	* low cost
	* scalability
	* high availability
* Capacity types
	* Serverless
	* Provisioned


## Dynamodb
* Non-relational Database (NoSQL)
* Replacement of Oracle NoSQL, Cassandra DB, and MongoDB; Amazon DynamoDB does not allow for alternative NoSQL database software options.
* Features
    * Fully managed
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


## ElasticCache
* A data caching service used to help improve speed/performance of web applications running on AWS
* Cache in memory
* Supported open-source in-memory engines
	* **Redis** A fast, open source, in-memory data store and cache
	* **Memcached** A common memory object caching system


## Amazon Redshift
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


## ELB 
* Evenly distributes traffic among EC2 instances
* Can be created under EC2 in AWS console
	* We can test the ELB by accessing the ELB's 'DNS name' from a browser
* Types
	* Application load balancer (HTTP(s))
	* Network load balancer (TCP/TLS)
		* For configuring traffic for Internet Gateway, we can create an ELB as an internet-facing load balancer on Internet Gateway attaching to the VPC
* ELB is a foundational component of **high availability** and **fault tolerance**


## Autoscaling
* Definition: automation of process for adding or removing EC2 instances based on traffic demand
* **Autoscaling Group** Logical grouping of EC2 instances for the purpose of scaling
* Autoscaling are triggered by rules (scaling policies)
	* e.g. scale up with CPU utilization is over 80%
* Lower and upper bound for number of instances can be specified
* Benefits
	* includes all benefits from ELB
	* adds scalability and elasticity


## Route 53
* Place to configure and manage web domains for websites and applications you host on AWS
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

## CloudFront
* Content Delivery Network (CDN) that allows users to cache content at "edge locations" (Points of Presence) located all around the world. 
	* By replication of the data to edge locations at the first time when the user near that edge location accesses the data 
	* Creates an alias in Route 53 which points to the edge locations instead of the origin server
* Benefits
	* Allows customers to access the contents more quickly
	* Provides additional security (AWS Shield - there is a free version)
		* Protects against DDoS attacks by redirecting the attacks from source server to edge locations
	* Low latency and high transfer speeds



## Lambda
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

## Amazon Cognito
* User Pool Authentication
* Standard attributes MUST be specified during creation of the user pool
    * e.g. address, birthdate, email, family name, etc.


## API Gateway
* Authentication
    * can perform some authentication, but still need Cognito
* Creating API
    * pass RESTful resources
* Deploying API
* Caching
* Throttling
* Swagger - open API specification
* Invoking API - generate SDK


## AMI (amaz machine images)
Provides the information required to launch an instance (EC2)


## AWS SAM
* Template driven Extension on CloudFormation
* Helps debugging Lambda functions



## Queueing Services
* Consumer-Producer
    * Synchronous process wastes resources & does not tolerate failure very well
    * Asynchronous process - can read / write any time

### SQS
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

### SNS
* SNS is used to automate emails and SMS messages triggered by events taking place in an AWS account.
* Features
	* PubSub pattern
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

### Amazon MQ

### SES

## Management Services
### CloudWatch
* Manages logs and metrics
* By default, CloudWatch analyzes AWS resources for metrics every 5 minutes for free.

### CloudTrail
* CloudTrail is a service that allows for auditing of IAM users within in AWS account.
* Mainly for security analysis, troubleshooting, and resource change tracking
* Can monitor specific activities in S3 or Lambda



## Developer Tools

###Code Build

* a fully managed continuous integration service that compiles source code, runs tests, and produces software packages that are ready to deploy
* eliminates the need to set up, patch, update, and manage your own build servers and software. There is no software to install or manage.

### CodeDeploy


### CodeCommit


### CloudFormation


## CDK
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


## AWS Security & Complience 
### AWS Shared Responsibility Model
* AWS is responsible for hardware layer, infrastructure, and basic softwares
* Clients are responsible for
	* Network-level security (NACLs & Security Group)
	* IAM
	* OS patches & updates
	* Client & server side encryption

### Client Penetration Testing
* Penetration testing can be done to some of the AWS services without prior approvals, e.g.
	* Penetration testing of EC2 instances
	* Penetration testing AWS CloudFront
	* Lightsail
	* RDS
* Penetration testing which needs approval
	* S3
	* Route 53
* Prohibited activities
	* DNS Zone walking via Amazon Route 53 hosted zones
	* Port flooding
	* DDoS attacks

### AWS Security Services
* AWS Shield - mentioned in route 53
* Amazon GuardDuty
	* threat detection service 
	* continously monitor and protect AWS accounts

### AWS KMS (Key Management Service)
* Service for creating and managing keys
* Key may be generated in KMS
	* can also be generated in CloudHSM
* Can integrate with a number of AWS services and provide keys
	* S3 would be the service in which KMS could encrypt an object.
	* Integrates with CloudTrail to log KMS key events.


## AWS Quick Start
* Templates to start AWS developments


## AWS Analytics
### Athena
* Serverless interactive query service

### EMR (Elastic Map Reduce)
* Managed Hadoop framework


## Amazon Lightsail
* Private virtual server


## Amazon Rekognition
* Video/image analysis
* can identify objects / people


## Amazon Mechanical Turk
* Crowdsourcing marketplace for outsourcing


## Cost & Support
### AWS Organizations
* Allows managing billing for multiple AWS accounts
	* Can be used to centrally manage policies from a master account for security and compliance purposes.
* Free to all AWS customers
* Can enjoy pricing benefits from aggregated usage

### AWS Pricing Models
* Pay-as-you-go
* Save when reserve instances
	* RDS & EC2 can be purchased at a bulk discounted rate for a term for reserved instances.
* No termination fees
* May have volume discounts

### Free Tier
* Periods: trial, 12 months free, always free

### TCO (Total Cost of Ownership) Calculator
* Free tool to estimate cost savings to use AWS vs. a data center

### Pricing Calculator
* Replacement of AWS Simple Calculator
* Estimates cost of each AWS services in a particular month

### Cost Explorer
* Free tool to check actual charges on the AWS services 
* Shows 13 months (current + past 12 months) of billing history information

### AWS Support Plans
* Basic
	* have access to AWS Trusted Advisor
* Developer 
	* $7 per month
	* have email access to Cloud Support Associates during business hours
* Business
	* starts $100 per month
	* starts having 24/7 access to Cloud Support Engineers
* Enterprise
	* starts with $10,000 per month
	* receives support in less than 15 minutes when the support care is related to business-critical systems down

### If an AWS account is compromised, owner needs to
* respond to notifications from AWS in the AWS Support Center
* change the password for all IAM users 
* delete any suspicious resources
* change the root password
* rotate and delete all API access keys

### Billing Service
* Shows not only the bills, but also the free tier usages
* Under preferences, we can set up alerts about free tier usages

## Mock Exams Review
* 5 pillars of the AWS Well Architected Framework
* AWS Service Health Dashboard
	* determine if there are any issues with AWS that may be affecting your account
* AWS Marketplace
* Elastic Beanstalk 
* AWS Optimizations
* AWS Trusted Advisor
* AWS Inspector
* Amazon Macie
* AWS Cloud Best  Practice
* Resource Groups
* Cost Allocation Tags
* Is IAM a global AWS service?