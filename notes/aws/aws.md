# AWS Cloud
## Architecture Evolution
* Traditional Client-Server Architecture
	* Enable multiple distributed systems connecting together
* Traditional Data center challenges
	* Server sprawl(space)
	* Cooling
	* Power
* Evolution: Cloud
	* e.g. Instead of storing stuff in PC, we store in Google Drive, Dropbox, etc.

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
    * DaaS: Desktop as a Service e.g. Amazon Workspaces
    * FaaS: Function as a Service e.g. Lambda
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
    	* Pay only for usage
    	* No long-term commitment or upfront charges
    * economies of scale
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
    * AWS engineers are responsible for e.g. maintenance, DDos attacks, delays, etc.
    * *Availability*, *fault tolerance*, and *scaling* are handled by AWS
        * e.g. hosting a static website on S3
    		* Developers don’t need to worry about actual physical hosts, instead just enjoy the service
* AWS Service Stack
    * AWS Foundation Services
        * Compute i.e. CPU + RAM (ability for processing)
            * EC2 (Elastic Compute Cloud); can combine with Elastic Load Balancing and Auto Scaling
            	* An instance is a virtual server in the AWS cloud
        	* Lambda: serverless
				* AWS manages where the code runs
        	* Autoscaling
        		* 3 types: manual, scheduled, dynamic
        * Networking - communication means
            * e.g. VPC, Route 53, Elastic Load Balacing, CloudFront
        * Storage
            * e.g. S3, EBS, EFS, Glacier
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
* VPC is the basis of all aws networking services
* Direct Connect: connect corp network/infrastructure (e.g. own data center) to AWS environment via VPC
* Route 53: AWS service for DNS (Domain Name Services): domain name -> ip resolution

### Upon AWS Account Creation
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

## AWS Management Console Basics
* Resource groups - allows user to add tags to services to combine into one group
	* Organize your AWS resources
		* e.g. Can manage a large number of S3 buckets and automate tasks on these buckets at one time
	* Can add and manage custom tags on AWS resources
* Stick-pin: Drag service on toolbar for frequent access




# IAM (Identity and Access Management)
* Authentication and authorization for AWS resources
	* Manage users and levels of access
* Free to use; no fee for any usages

## Features
* Granular Permissions
* Identity Federation (e.g. login via Facebook, Linkedin) via Cognito
* Explicit Deny would override all other conflicting policies
* Policy Simulator
	* can test and troubleshoot IAM and resource-based policies attached to IAM users, groups, or roles in your AWS account
	* can test which actions are allowed or denied by the selected policies for specific resources
	* Needs the context keys being referenced to the policies
	* CLI: `aws iam simulate-custom-policy`
* When EC2 assumes a role, the underlying application shares the permissions

## Terms
* **Principal** a person or application that uses the AWS account root user, an IAM user, or an IAM role to sign in and make requests to AWS.
* **Identities** the IAM resource objects that are used to identify and group. 
	* You can attach a policy to an IAM identity. These include users, groups, and roles.
* **Entities** the IAM resource objects that AWS uses for authentication (represented by IAM users, roles, groups)
	* Entities represent the actors on the system, and they may each have multiple **identities**
* Root account 
	* created automatically once the AWS account is created
    * have full access to the AWS account (can delete the AWS account as well)
    * can transfer information through route53 to other AWS accounts
* Policies (documents)
	- Defines what actions are allowed or denied for specific AWS resources
	* A policy is a JSON doc with a list of statements with the following components
		1. Effect: allow / deny
		1. Action: a list of operations; specific APIs to the AWS service
		1. Resources are specified via ARNs
			* ARN format: **arn:partition:service:region:account_id:{resource, qualifiers}** e.g. arn:aws:s3:us-east-1:1234:bucket_name/object
    * Policy to identity or resource
    	* Identity-based policy (attach to user / role)
		* Resource-based policy (has principal field)
			* specifies who has what access to the resource 
    * Policy Simulator can be used to see potential effect
	- Managed policies
		1. AWS Managed: A standalone policy that is created and administered by AWS 
			* common use cases
		1. Customer Managed: created by users
	- Inline policies
		* A policy embedded in an IAM identity (inherent part of the identity)
		* Attached upon identity creation
		* Managed by the user
		* Managed policies are recommended over inline policies
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
* Roles (an entity)
    * Attaching policy to a role allows a AWS service, group, or user to access another AWS service in the same / different account
    * STS - Security Token Services
        * issuing tokens valid for 1 to 36 hours
    * More secure than storing access keys & secret access key on individual EC2 instances
    * Can grant permissions to users in a different account
    	1. Create an IAM policy in account A for the A resource permission
    	1. Attach the policy to an IAM role in A which references the AWS account id of another account B
    	1. Create an IAM policy in B to allow assume the role in A to get access 
* Power User Access
	* Access to all AWS services except the management of groups and users within IAM.


## Credentials
* Security: availability, integrity, confidentiality
* Console - username / password
* CLI / SDKs / Query API - access key / secret key
    * .aws/credentials:
        * Storing profiles
        * [default], [test], [prod]
* Good practice: MFA
	* Can be applied to root / other IAM users
* SDKs automatically sign all requests with the credentials set up
* Sequence for checking credentials:
	* code
	* environment variables
	* default credential profiles in credential files
	* EC2 instance role


## Default Credential Provider Chain
1. Environment variables–AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
1. Java system properties–aws.accessKeyId and aws.secretKey.
1. Web Identity Token credentials from the environment or container.
1. The default credential profiles file
1. Amazon ECS container credentials
1. Instance profile credentials

## Permission Boundaries
* Help delegate admin to other users without granting too many permissions
* What does it do?
	* Set IAM users a boundary to limit the scope of their permissions
* Management
	* 'IAM' -> 'Users' -> 'Permissions' -> 'Permissions Boundary'
* Benefit
	* Prevent privilege escalation / unnecessarily broad permissions

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
    * Create customized sign-in links for non-root users
* Do *NOT* 
    * use Root Account
    * attach policies to groups (all users would have the policy)
    * store credentials in git / code



# AWS Resource Access Manager (RAM)
* securely share your resources across AWS accounts within this or another AWS Organization
	* sharing to an account outside AWS Organization would send an invitation that must be accepted before sharing
* Features
	* Can share EC2, Aurora, Route 53, App Mesh, Resource Groups, CodeBuild, License Manager
	* Even can share when resource sharing is disabled in the AWS Organization
* Management
	* 'RAM' -> 'Create Resource Share' -> Specify AWS accounts for sharing
	* In the other AWS account, accept the pending request for sharing
* RAM vs AWS Organizations
	* RAM shares resources from the AWS account, while AWS Organizations manage via Master AWS account
	* AWS Organization cannot directly share resources to another AWS Org


# AWS SSO
* Centrally manage access to AWS accounts and business applications
* Features
	* One place to sign in a lot of resources
	* Can grant granular permissions
	* Enable login to SAML (Security Assertion Markup Language) 2.0-enabled applications


# STS (Security Token Service)
* Returns temporary security credentials for authenticated users 
	* via `assume-role-with-web-identity` API
* For mobile app, Cognito is recommended. For regular web app, we can use the STS API.
* `aws sts decode-authorization-message`
	* Decodes additional information about the authorization status of a request from an encoded message returned in response to an AWS request


# VPC (Virtual Private Cloud)
* Can be think of a virtual data center in the cloud
	* VPC allows launching AWS resources into a **logical-isolated virtual network**, which closely resembles a traditional network in data center
		* User has full control on who can access the resources
		* Analogy between facebook profile and VPC
* Features
	* Cannot span multiple regions, but it can span in multiple AZs
	* A virtual network dedicated to your AWS account
		* Can specify IP ranges
		* Can create subnets
		* Configure route tables & network gateways
	* It is also the networking layer for Amazon EC2
		* Upon provisioning/launching an EC2 instance, we would need to specify VPC and subnet for network layer
		* An EC2 instance can only attach to 1 VPC
	* Traffic between your VPC and the other service does not leave the Amazon network.
	* Can have up to 5 non-default Amazon VPCs per AWS account per AWS Region, but you can place a support request to increase the number.
* Components
	* Public subnet
		* Internet <-> IGW (in VPC) <-> Router <-> Route table <-> NACL <-> subnet (in an AZ) <-> Security Group <-> EC2 instance
* Constraints
	* AWS reserves both the first 4 and the last IP address in each subnet's CIDR block
* The purpose of an egress-only internet gateway is to allow IPv6 based traffic within a VPC to access the internet, whilst denying any internet based resources to connection back into the VPC.


## Networking Terms 
* Ipv6 is created to solve IPv4 depletion
* Domain names (URL e.g. www.google.com)
	* Controlled by IANA (Internet Assigned Numbers Authority)
	* Top Level Domain: the last word in the domain name
		e.g. `.com`, `.uk`
	* Second Level Domain: The second word in a domain name; could be optional depends on TLD
		e.g. `.co.uk`, `.gov.uk`
* Registrar
	* An authority that can assign domain names directly under top level domains
	* e.g. Amazon, GoDaddy.com
	* InterNIC (a service of ICANN)
		* Enforces uniqueness of domain names across the internet
		* Domain names becomes registered in a central DB - WhoIS datebase
* NS (Name Server) records
	* Allow TLD servers to direct traffic to contents DNS server, which contains the authoritative DNS records (e.g. SOA)
* SOA (Start of Authority Record)
	* Normally DNS name servers are set up in clusters. The database within each cluster is synchronized through zone transfers. The SOA record for a zone contains data to control the zone transfer. This is the serial number and different timespans.
	* Contains DNS record
	* Sample: `ns1.dnsimple.com admin.dnsimple.com 2013022001 86400 7200 604800 300`
* A (Address) record
	* Fundamental type of DNS record
	* Used by a computer to translate the domain name to an IP address
* AAAA record
	* Same as A record excepts that the IPv6 address is specified instead of IPv4
* MX Records
	* Used for mail
* PTR Records
	* Reverse of A record
* CName
	* Canonical Name
	* Resolve (map) one domain name to another
	* Cannot be used to map naked domain names (zone apex record)
		e.g. cannot resolve https://amazon.com
* Alias Records
	* Act like a CName
	* Can be used for naked domain names (zone apex record; aka the top node of a DNS namespace)
		* Naked domain names are the domain names with `www` removed
	* Can contain a pointer to a CloudFront distribution, an Elastic Beanstalk, an ELB, S3 
	* Alias provides a Route 53-specific extension to the DNS functionality
		* Upon DNS query that matches an alias record, route 53 can route domain name to the resources specified in the alias record
		* e.g. to route domain traffic to an ELB load balancer, use Amazon Route 53 to create an alias record that points to your load balancer.
* Senario
	1. User type domain name in browser
	1. Browser goes to TLD (top level domain) server and retrieve NS records
	1. Retrieve SOA from NS
	1. Retrieve A (address) record from SOA 
	1. Get IP address from A record


## Subnet
* A subnet is a subsection of a network
	* Includes all computers/hosts in a specific location
	* Analogy: home network is a 'subnet' of the ISP's network
* The machines within the same subnet would have the same IP prefix
* In AWS, a subnet is a range of IP addresses in your VPC.
* Basics 
	* Subnets **cannot** span multiple AZs; each subnet must reside entirely in one AZ
	* A VPC may have one or more subnets 
	* Multiple subnets can be created in one AZ
	* AWS resources can be launched into a specified subnet.
	* Customize IP range
		* Largest subnet has a prefix of 16 in IP address (i.e. IP range: $$2^{16} = 65536 $$)
	* Any user-created VPC subnet WILL NOT automatically assign Public IPv4 Addresses to instances
	* AWS releases an EC2 instance's public IP address when it is stopped, hibernated, or terminated.
* When the default VPC is created, a default subnet is created in each of the AZs of the default region
	* Each EC2 would be assigned a private & public IP and reside in a default subnet if no subnets are specified during instance creation
* Subnet types
	* Public
		* Able to access the internet via a route table with a IGW rule
		* To allow EC2 instances in user-created public subnets reach internet, need to create an Elastic IP (A static IPv4 address designed for dynamic cloud computing) and associate it with your instance
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
* Upon detaching an IGW, the route table still attaches to the detached IGW; however, the IGW would no longer have access to the Internet
* Only one internet gateway can be attached to a VPC at a time.


## Route Table
* A route table contains a set of rules, called routes, that are used to determine where network traffic is directed.
	* Can be seen as a GPS of the VPC
* Each VPCs has a **main** route table


## Networking Security
* Firewall: A type of software that either allows or blocks certain kind of internet traffic to pass through it 
* `0.0.0.0/0` would allow ANYONE from ANYWHERE to connect to your instances. 
* `ssh` access: inbound/outbound for NACL and inbound for SG 
* In a custom VPC with new subnets in each AZ, there is a route within the route table that supports communication across all subnets/AZs. Additionally, it has a Default SG with an "allow" rule: all traffic, all protocols, all ports, from resource using this default security group.

### Network Access Control List (NACL)
* A firewall on subnet level for both inbound & outbound calls
* Used to control access among subnets and between subnet & internet
	* e.g. Block IP addresses
* Auth is based on rules
	* Rules are evaluated based on rule number from lowest to highest
	* The first rule that would apply to the traffic would be applied immediately (like a group of OR statements)
	* Each network ACL also includes a rule whose rule number is an asterisk. This rule ensures that if a packet doesn't match any of the other numbered rules, it's denied. You can't modify or remove this rule.
	* Components: Rule #, type, protocol, port range, source / destination, allow / deny
* **Stateless** - so NACL would check inbound & outbound separately
* In 'default' NACL (auto created for the default VPC), all outbound/inbound traffic are allowed by default. In a new NACL, all traffic would be denied by default
* Each subnet must be associated with one and only one NACL at a time. Will associate with default NACL if not specified
* Each NACL can be associated with multiple subnets

			

### Security Group
* Acts as virtual firewall to one or more instances on the instance/server level
* Management
	* To view SGs & rules, go to 'EC2' -> 'Instances' 
	* Can use multiple SGs for one instance: 'Instances' -> 'actions' -> 'Networking' -> 'Change Security Groups'
* Rules are different from NACLs
	* Implicitly deny all inbound traffic and **allow** all outboound traffic
	* No deny rules available, so if want to deny certain traffic, just don't create related rules 
	* Rule changes would be in effect immediately
	* Cannot block specific IP addresses (can use NACLs to achieve this)
	* All rules are evaluated before the decision is made
	* Components: source, protocol, port, comments
	* Sample: Inbound - 0.0.0.0/0, TCP, 443, Allow inbound HTTPS access from any IPv4 addresses
* Security Group is **stateful**
	* If a certain inbound port is allowed, outbound port is set to allowed too by default
	* Can have separate rules for inbound & outbound
* Cannot span VPCs
* NACL -> building access; security group -> room access
* Can specify separate rules for inbound & outbound
			


## VPC Peering
* A VPC peering connection is a direct network route between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses
* Feature
	* 2 VPCs in different AWS regions and under different AWS accounts can share traffic between each other
	* can peer cross region (need to set up VPC peering first)
* Use cases
	* Replicate data to geographically distinct locations for fault-tolerance, disaster recovery and redundancy
* Note
	* The logical networks still use the same common AWS backbone network infrastructure to communicate
	* Traffic between VPC peers is encrypted by default
	* No transitive peering is allowed. i.e. cannot connect from A to C via B if there is no VPC peering between A and C
		* Can use AWS Transit Gateway (see below) instead
	* Edge to edge routing through a gateway or private connection is not supported.
		* i.e. cannot extend the peering relationship to AWS Direct Connect connection or IGWs
	* All resources in the VPC would have access to resources in another VPC


## NAT Instances 
* A single EC2 instance acting as a bridge between a private subnet & a public subnet
	* Reside in public subnet
* Not very scalable; could increase the NAT instance size (vertical scale)
* Can achieve high availability via
	* Autoscaling group
	* Multple subnets in different AZs
	* Script to auto failover

### Management
1. Creation
	* EC2 -> Create Instance -> Choose AMI -> Community AMIs -> Type 'NAT' -> Select public VPC -> Select SG
1. Need to **disable source/destination checks (required for any NAT instances)**
	* Actions -> Networking -> 'Change Source/Dest. Check'
1. Add route in main route table to help private subnet get access to internet
	* Put NAT instance as target and `0.0.0.0\0`
	* If NAT instance is terminated, then the status of route would become 'Blackhole'


## NAT Gateways
* Highly available gateway to allow private subnet communicate to internet via public subnet
* More scalable solution than NAT instances
* Cannot span AZs, but redundant in 1 AZ
* Not behind SGs
* 5 Gbps - 45 Gbps

### Management
1. Needs to be created in the public subnet
1. Edit route table
	* Add `0.0.0.0\0` and NAT Gateway


## VPC Flow Logs
* A feature enables capturing info about IP traffic going to / from network interfaces in VPC
* Stored in CloudWatch or S3
* Can attach tags to logs
* Can be created at 3 levels
	1. VPC
	1. Subnet
	1. Network Interface level

## Bastion
* Definition: A computer to withstand attacks outside of a firewall or in a public subnet
* Behind a NAT instance/gateway
* 2 ways to achieve high availability
	1. 2 EC2 bastion instances in 2 AZs with a NLB
		* Cannot use ALB as we are still in layer 4
	1. 1 EC2 bastion instance behind an Auto Scaling group with health checks and a fixed EIP (Elastic IP)
		* Cheaper but has downtime

## VPC Endpoint
* A VPC endpoint enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. 
* Features
	* Communication would not leave Amazon Network
		* Instances in your VPC do not require public IP addresses / NAT / IGW to communicate with resources in the service.
	* Endpoints are horizontally scaled, redundant VPC components (virtual devices)
* Types
	1. Interface endpoint 
		* An ENI with a private IP address that serves as an entry point for trafic destined to a supported service
			* Basically attaching an ENI to the EC2 instance and connect via AWS internal network
		* Supports API GW, Cfn, CW, EC2, ELB, KMS, Kinesis, SNS, SQS, etc
	1. Gateway endpoint
		* Instances in private subnet can send traffic directly to VPC gateway then to S3 (without NAT)
		* Support S3 & DynamoDB

### Management
* Creation
	* 'VPC' -> 'Endpoints' -> Choose interface/gateway endpoint -> select VPC & Route table
	* Will be created instantly, but update to route table would take around 5 min

## VPN
* A VPC/VPN Connection utilizes IPSec to establish encrypted network connectivity between your intranet and Amazon VPC over the Internet
* Use cases
	1. an immediate need
	1. have low-to-modest bandwidth requirements
	1. can tolerate the inherent variability in Internet-based connectivity
* A VPG sits at the edge of your VPC and is a key component when using a VPN. It's responsible for site-to-site connection from on-premises to a VPC.

### Customer Gateway
* A customer gateway is a resource that is installed on the customer side and provides a customer gateway inside a VPC.
* On-prem network -> customer gateway device -> Internet -> Virtual private gateway

## VPC Management
* VPC creation
	1. 'Create VPC'	
		* Will auto create a route table, a NACL, and a Security group when a new VPC is created
	1. 'Create Subnet' for the new VPC
		* Have the option to enable 'auto assign IPv4 addresses'
	1. 'Create internet gateway' -> 'Attach to VPC'
	1. Configure route table
		* 'Route Tables' -> select route table -> 'Routes' tab
		* BP: Any unassociated subnets would be routed to the main route table. If we allow public internet access to main route table, we would be prone to security risks. Thus it's best to create a separate route table for public internet access
	1. Create public route table
		1. Create in and out routes to internet: `0.0.0.0/0` & `::/0` to `IGW`
		1. Add public subnets to the public route table
* Launch EC2 in VPC
	1. 'Configure Instance' -> 'VPC'
	1. 'Configure Security Group'
* To ssh into the EC2 instances
	* Create a security group and add inbound rules 
		1. 'All ICMP - IPv4' and specify the source as IP address or another SG
		1. 'SSH'
	* For prod, use Bastion host


# Direct Connect
* A cloud service solution that makes it easy to establish a **dedicated private network connection** from your premises to AWS 
	* via one of AWS Direct Connect locations. In each locations, there would be AWS cages & Customer Cages
	* AWS cages & Customer cages connect via X-Connect
* Useful for high throughput
* Running VPN through Direct Connect connection would have faster speed & improved security

## Virtual Private Gateway
* A logical, fully redundant distributed edge routing function that sits at the edge of your VPC
	* Amazon VPC side of a VPN connection
* Is used to connect the AWS cloud with clients' on-premises data center
* VPG vs IGW
	* VPG is for connecting to Internet, whereas VPG is for VPN connection

## Steps for creating a Direct Connect
1. 'Direct Connect' -> Create a virtual interface (public)
1. 'VPC' -> 'VPN connections' -> 'Customer Gateway'
1. Create a 'VPG' and attach to desired VPC
1. 'Create new VPN connection' -> Select the VPG and the Customer Gateway
1. Once VPN is up, setup the VPN on customer gateway or firewall




# Route 53
* Place to configure and manage web domains for websites and applications you host on AWS
* Route53 is not Region-specific
* Functions
	* Domain registration
		* e.g. buy 'www.example.com' for a year
		* Steps
			1. Go to 'Domain Registration'
			1. Domain Search -> Type & Search -> Register
			1. Can check 'Pending requests' for status
				* Could take up to 3 days to complete; usually would be ready in 1 or 2 hours
			1. Once provisioned, Check 'Hosted zones' / 'Registered domains' to view the domain name
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
* Constraints
	* Can manage 50 DN by default; can contact support to increase
* Naming
	* DNS is on port 53, so AWS DNS is called Route 53
* How long does it takes for hosted zone in Amazon Route53 changes to reflect globally?
	* DNS resolvers can only reflect the changes in cache after TTL has expired, which is 24 hours by default
	* After TTL expires, DNS resolvers would make queries for changes
	* If there are changes, it takes 60s for name servers to save the changes. The changes would propagate simultaneously globally 
* DNS config for web servers
	* ALBs require an Alias to ALB and a record type "A – IPv4 address". CNAME record maps a name to another name, it can't be used with the public IP address of the ALB. However, a CNAME can be used to route traffic to your ALB DNS name (A Record).
	* attaching EIPs directly to the instances with an "A" record accomplishes similar results, but doesn't incur the cost of an ALB


## Routing Policies
* Management
	* 'Hosted Zones' -> select domain name -> 'Go to Record Sets'
	* 'Create Record Set'
	* Paste IP addresses, Update TTL (time to live for DNS cache)
	* Select Routing Policy types
* Can integrate with health check
	* This would prevent routing to a record set which fails health checks until it passes again
	* Can set health checks on individual record sets
	* Can set SNS to alert if a health check is failed

### Policy Types
1. Simple Routing
	* Only have 1 record with multiple IPs 
	* Route 53 would return all IPs at random order to users
	* No health check
1. Weighted Routing
	* Split traffic based on assigned weights
	* e.g. 80% to US-EAST-1 and 20% to US-WEST-2
	* To create a weighted routing
		* Create n record sets to the same A record pointing to different IPs so that the assigned weights aggregate to 100
1. Latency-based Routing
	* Route 53 selects which record set to use based on the region which gives user the lowest latency
1. Failover Routing
	* Need to specific a primary record set & secondary record set
	* Send traffic to the primary DNS record set by default, and send to secondary record set if the primary record set fails health checks  
1. Geolocation Routing
	* Will send traffic depends on geolocation (continents / countries)
1. Geoproximity Routing (Traffic flow)
	* Beyond scope
1. Multivalue Answer Policy
	* Simple Routing + health check




# CloudFront (It's like a Supermarket which gets supply from farms and provide products to customers)
* Content Delivery Network (CDN) that allows users to cache content at "edge locations" (Points of Presence) located all around the world. 
	* By replication of the data to edge locations at the first time when the user near that edge location accesses the data
	* There is a TTL assigned to the cache (customizable) 
	* Creates an alias in Route 53 which points to the edge locations instead of the origin server
* Features
	* Edge locations are not READ only; can write to them too
	* Can configure which cached data to deliver based on query string params
* Clear cache would be charged
* PCI compliant
	* If running PCI / HIPAA compliant workloads, it's recommended to log CloudFront usage data for 1 year for auditing purposes
		1. Enable CloudFront access logs
		1. Capture requests sent to CloudFront API
	* VPC Flow logs, CloudWatch, CloudTrail should be used as well
* Does not provide static IPs for applications
* Viewer Protocol Policy 
	* defines the protocols which can be used to access CloudFront content
	* Can redirect HTTP to HTTPS
- Origin Protocol policy
	- specify rules to communicate with custom origin
	- e.g. HTTPS only

## Origin
* Origin of all files that CDN would distribute
* e.g. S3, EC2, ELB, Route53

## Distribution
* The name given to the CDN which consists of a collection of edge locations
* 2 main types
	* Web - typically for websites
	* RTMP - Used for media streaming

### Content Access
* signed URLs
* signed Cookies

## Benefits
* Provides additional security (AWS Shield - there is a free version)
	* Protects against DDoS attacks by redirecting the attacks from source server to edge locations
* Low latency and high transfer speeds



# Other AWS Networking Services 
## Global Accelerator
* A networking service that sends your user’s traffic through Amazon Web Service’s global network infrastructure
* Components
	* Static IP addresses
		* Provides 2 static IP addresses that users associate with the accelerator by default
		* Users can use own IP addresses
	* Accelerator
		* direct traffic to optimal endpoint based on latency, location, health
	* DNS
		* Global Accelerator assigns each accelerator a default DNS name pointing to the static IP addresses 
	* Network zone
		* An isolated unit with own set of physical infrastructure and service IP addresses from a unique IP subnet
	* Listener
		* A listener processes inbound connections from client to Global Accelerator
	* Endpoint group
		* Associated with a specific AWS region
		* Traffic dial: control traffic
* Features
	* Local ISP -> Accelerator -> AWS Backbone network (instead of going through a bunch of ISP networks to reach AWS region)
	* Works in network layer
	* Can redirect user requests to the nearest edge location (or optimal endpoints) then to Amazon global network
	* Can reroute requests to healthy IPs
* How it works
	* Users -> Edge location -> Accelerator () -> Endpoint group -> Endpoints
* Benefits
	* Improving your internet user performance by up to 60%



## API Gateway
* Service for managing APIs (Front doors to AWS applications)
* Features
	* Publish, maintain, monitor, and secure APIs
	* Expose HTTPS endpoints to define a RESTful API
		* Gives an HTTPS address to the API
	* Auto scales
	* API key for tracking & controlling usage
		* Can control rate, burst, and quota
	* Caching
		* Cache endpoint's response for better performance
	* Throttling
		* Can implement method specific throttling / universal settings for all methods
	* Monitoring via CloudWatch
	* Maintaining different versions of API (e.g. beta & prod)
	* Integration with AWS Certificate Manager for free SSL/TLS certs
	* CORS
	* SOAP web service passthrough
* Authentication
    * can perform some authentication, but still need Cognito
* Management
	* Creating API
		* Define an API
	    * pass RESTful resources
	    	* define resources and nested resources (URL paths)
	    	* HTTP methods
	    	* Choose target (e.g. EC2, Lambda, DynamoDb)
	* Deploying API
		* to a stage
		* uses API Gateway own domain by default; can custom domain
	* Invoking API - generate SDK
* Options to deny IP addresses
	1. Resource policies
	1. AWS WAF
* Stages
	* Stage variables
		* Different backend endpoints can be specified for each stages via stage variables (configure vars in HTTP integration request of the API)
		* they are name-value pairs
		* Can be used as part of HTTP integration URL in the following cases:
			1. A full URI without protocol
				* e.g. http://${stageVariables.variable_name}
			1. A full domain
				* e.g. http://${stageVariables.variable_name}/resource/operation
			1. A subdomain
				* e.g. http://${stageVariables.variable_name}.example.com/resource/operation
			1. A path
				* e.g. http://example.com/${stageVariables.variable_name}/bar
			1. A query string
* Frontend interactions
	* Can be controlled by the config of Method request / response
* Backend interactions
	* Controlled by Integration request / response
	* e.g. DynamoDB as backend
* Deployment
	* a REST API deployment is represented by a Deployment resource
	* For the client to call your API, you must create a deployment and associate a stage with it
	* CLI: `aws apigateway create-deployment --rest-api-id <rest-api-id> --region <region>`
* XML / JSON
	- Need to work with request-response data mappings
* Canary Release
	- Traffic can be splitted into a production / canary release
* Gateway response
	- Can be used to customize client response
* Access Control options
	1. Cognito user pool
	1. IAM roles and policies
	1. Lambda Authorizers

### API basics
* Types
	1. RESTful (Representational State Transfer) APIs - 70% of real-world APIs are RESTful
		* Uses JSON for request and response payload
		* *REST* {REpresentational State Transfer) is an *architectural style* for providing standards between computer systems on the web, making it easier for systems to communicate with each other. 
    		* REST-compliant systems, often called RESTful systems, are characterized by how they are stateless and separate the concerns of client and server
    		* Systems that follow the REST paradigm are *stateless*, meaning that the server does not need to know anything about what state the client is in and vice versa
		* Leonard Richardson analyzed a hundred different web service designs and divided them into four categories based on how much they are REST compliant. This model of division of REST services to identify their maturity level – is called Richardson Maturity Model.
			* Level 0
			    * Use a single URI to identify an endpoint (for all requests), and HTTP POST to transfer SOAP-based payloads
			    * RPC: In distributed computing, a remote procedure call is when a computer program causes a procedure to execute in a different address space, which is coded as if it were a normal procedure call, without the programmer explicitly coding the details for the remote interaction.
			    * SOAP (formerly an acronym for Simple Object Access Protocol) is a messaging protocol specification for exchanging structured information in the implementation of web services in computer networks
			* Level 1
			    * Services employ many URIs but only a single HTTP verb – generally HTTP POST. They give each resource in their universe a URI. A unique URI separately identifies one unique resource – and that makes them better than level zero
			* Level 2
			    * Use different HTTP verb e.g. GET, PUT
			    * Services typically support several of the HTTP verbs on each exposed resource – Create, Read, Update and Delete (CRUD) services.
			* Level 3
			    * Use HATEOAS (Hypermedia as the Engine of Application State) - a component of the REST application architecture that distinguishes it from other network application architectures.
    1. SOAP (Simple Object Access Protocol) - outdated
    	* Uses XML


### CORS (Cross-origin resource sharing)
- A cross-origin HTTP request is one that is made to
	1. A different domain (e.g. from a.com to b.com)
	1. A different subdomain (e.g. from a.com to www.a.com)
	1. A different port (for example, from example.com to example.com:10777)
	1. A different protocol (for example, from https://example.com to http://example.com)
- Types of cross-origin requests
	1. Simple HTTP request
		- Don't trigger a CORS preflight requests to server
	1. Non simple requests
		- Need to send CORS preflight requests
			- CORS preflight request
				- Includes an Origin header.
				- Uses the OPTIONS method.
				- Includes the following headers:
					1. `Access-Control-Request-Method`
					1. `Access-Control-Request-Headers`
		- To support CORS, the REST API resource needs to implement an `OPTIONS` method to respond to preflight request with the following headers (can be defined in schema / AWS console)
			1. `Access-Control-Allow-Origin`
			1. `Access-Control-Allow-Methods`
			1. `Access-Control-Allow-Headers`
		- Example
		```
		"Access-Control-Allow-Headers" : "Content-Type",
        "Access-Control-Allow-Origin": "https://www.example.com",
        "Access-Control-Allow-Methods": "OPTIONS,POST,GET"
		```
- Lambda custom (non-proxy) integrations
	- API GW creates an OPTIONS method and attempts to add the `Access-Control-Allow-Origin` header to your existing method integration responses
	- For all responses apart from 200 response, need to manually modify the integration response to return the `Access-Control-Allow-Origin` header
- Lambda proxy integration
	- backend is responsible for returning the Access-Control-Allow-Origin and Access-Control-Allow-Headers headers


### Import APIs
* Can import API via Swagger (Open API) definition files

### Throttling
* Default: 10,000 TPS within an AWS account
* Concurrent requests across all APIs within an AWS account: 5,000 TPS
* Will receive `429 Too Many Requests` if go above the limit 


## AWS PrivateLink
* Resolve the problem to connect hundreds of VPCs together
	* Otherwise we would need to set up A LOT OF VPC Peerings
* Requires a NLB on the service VPC and an ENI on the customer VPC
	* Server VPC -> Server VPC NLB -> PrivateLink -> Customer VPC ENI -> Customer VPC 
* Benefits
	* Does not require VPC peering, route tables, NAT, IGWs, etc



## AWS Transit Gateway
* Simplify Network Topology via providing a central place to connect cloud networking services together
* Features
	* Supports VPN, VPC, Direct Connect
	* Transitive peering between thousands of VPCs and on-prem data centers
	* Can cross region
	* Support **IP multicast**
		* A method of sending Internet Protocol (IP) datagrams to a group of interested receivers in a single transmission



## VPN CloudHub
* Allow users to use VPN hub to connect to different sites with their own VPN connections 
* Features
	* Operates over public internet
	* All traffic between customer gateway and VPN CloudHub is encrypted


## Network Billing
* Cross AZ: $0.01 per GB for private IP addresses, and $0.02 per GB for public internet connections 
* Same AZ: no charges



# EC2 (Elastic Compute Cloud)

## Terms
* **Instance metadata** programmatically retrieve information from an EC2 instance including public keys, private/public ip address, and instance id
	* data about your instance that you can use to configure or manage the running instance
	* Sample command: `curl http://169.254.169.254/latest/meta-data`
* **User data** user specified when launching your instance
	* e.g. specify parameters for configuring your instance, or include a simple script
	* Can assign user data in tags to help manage EC2 instances
	* Sample command: `curl http://169.254.169.254/latest/user-data`
* Vertical scaling
	* Increasing the size and computing power of a single instance or node without increasing the number of nodes or instances.
* Horizontal scaling
	* Provisioning additional servers to meet your needs
* Tenancy
	* Once a VPC is set to Dedicated hosting, it can be changed back to default hosting via the CLI, SDK or API.
		* this will not change hosting settings for existing instances, only future ones
	* The tenancy of an instance can only be changed between variants of ‘dedicated' tenancy hosting. It cannot be changed from or to default tenancy hosting.
		* Tenancy change can apply on the fly
* Tags
	* Can add tags to define which instances are for prod / dev. 
	* Can control access via IAM policy for tags

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
	* In EC2, this is an ENI / ENA / EFA
* Firewall: security
	* In EC2, this is a security group

 
## Use Cases
* Web application
* Web servers
* Video processing
* GPU workloads

## Purchasing options
* On-demand
	* Most flexible
	* Charge by seconds or by hours
	* No upfront / commitment
* Reserved
	* need to pay for 1 - 3 years
	* Significant price discount
	* types
		* Standard Reserved Instances
			* significant discount (up to 72%) compared to On-Demand Instance pricing
			* 1-year or 3-year term.
			* Have the flexibility to change the AZ, the instance size (e.g. m5.large -> m5.xlarge), and networking type (e.g. Enhanced Networking) of the instances
			* More upfront payment / longer term -> greater discount
		* Scheduled Reserved Instances
			* purchase capacity reservations that recur on a daily, weekly, or monthly basis, with a specified start time and duration, for a 1-year term
		* Convertible Reserved Instances
			* Can exchange instance family, instance type, platform (e.g. from windows to linux), scope, or tenancy for a 1-year term
* Spot 'bid/auction'
	* only pay and use an instance when the spot price <= the 'bid' price
		* biggest savings; up to 90%
		* spot price fluctuates based on market supply and demand
		* Have **2 min** to decide whether to stop an instance when spot price > 'bid' price
			* Could use **Spot Blocks** to auto prevent terminating the instance for 1 - 6 hours 
	* allows AWS to sell the use of **unused instances**
	* could be terminated if the computing capacity is needed by on-demand customers
		* if terminated by AWS, customers would not be charged for a partial hour of existing usage
	* Request types
		1. One time
		1. Persistant
	* Spot Fleet
		* A collection of spot instances (and optional on-demand instances)
	* **Capacity Rebalancing** helps you maintain workload availability by proactively augmenting your fleet with a new Spot Instance before a running Spot Instance receives the two-minute Spot Instance interruption notice
	* **Capacity optimized allocation strategies** in Auto Scaling groups help you to provision your target capacity without the need to manually look for the Spot Instance pools with spare capacity
		* auto provisions instances from the most-available Spot Instance pools
	* Cannot enable 'Termination Protection' for spot instances
	* Users would NOT get interrupt notifications 2 minutes prior if AWS would perform hibernation on the instance
		* Hibernation would start immediately
	* Use case
		* Suitable for clients who need the instances for only a few days in a week and does not care about service interruptions
* Dedicated
	* Most expensive
	* Use case
		* when you have strict server-bound licensing that won't support multi-tenancy or cloud deployments
			* **Multi-tenancy** when multiple customers are running workloads on the same hardware
			* **Single-tenant** when a single customer has dedicated hardware
		* Regulatory requirement
		* Could be on demand; Could be reserved to receive up to 70% off

## Instance types
* F - FPGA (Field Programmable Gate Array)
* I - High Speed Storage; IOPS 
* G - Graphics 
* H - High Disk Throughput (e.g. MapReduce, distributed file system)
* T - Lowest cost; general purpose
	* Use cases: web server, small DBs
* D - Dense Storage 
* R - RAM: Memory Optimized
* M - Main choice for general purpose
* C - Compute
* P - Pictures: Graphics/General Purpose GPU
* X - Extreme Memory 
* Z - Extreme Memory & CPU
* A - Arm-based workloads
* U - Bare Metal

## Cost
* Depends on 
	* purchase options
	* instance types
		* Database Optimized is not an instance type.
	* AMI types
	* Region
	* If upfront

## IAM & EC2
* Attaching an IAM role
	* The instance can be running / stopped
* Replacing an existing IAM role on EC2 instance
	* The instance must be in running state
* Changes to the IAM Policies attached to the EC2 IAM Role would be applied immediately


## EBS (Elastic Block Store)
* Block-based virtual hard drive for the instance
	* Always are in same AZ as EC2 instance (can move with instance to another AZ)
	* Termination Protection is turned off by default
* Features
	* Highly reliable and available
	* Auto replicated within AZ to protect from component failure
	* Could persist indefinitely from the life of the instance (i.e. could be persisted even if the instance is terminated)
		* When the instance is terminated
			* Root EBS volume would be deleted by default 
			* Other EBS volumes attached would be persisted
	* EBS Root Volumes & additional volumes can be encrypted
	* Detaching root volumes need to stop the instance as root volumes contain OS; detaching additional EBS volume does not need to stop the instance
* Pricing
	* bases on storage (i.e. GB)
* Management
	* View: 'EC2' -> 'EBS'
		* Distinguish root EBS: the one that comes with the AMI (see snapshot) 
	* Create 
		1. Create EC2 instance -> 'Add storage'
		1. Create under 'EBS'
	* Modification: under 'EBS'
		* can resize EBS and update type (update on the fly - the effect would not bring down the EC2 instance)
	* To move EBS volume with instance to another AZ, we can take a **snapshot** and create an AMI from snapshot to be deployed into another EC2 instance in another AZ or region

### EBS Snapshots
* They are incremental - Only the blocks that have changed since last snapshot would be persisted in S3
* CLI Command: `aws ec2 create-snapshot`
* Can be used normally during snapshoting (async)
* Encryption
	* Can only share unencrypted snapshots
	* Snapshots of encrypted volumes would be auto encrypted
	* Can enable encryption for unencrypted root device volume:
		1. Create an unencrypted snapshot A
		1. Create a copy of A as B and select the encrypt option
		1. Create AMI from B
			* CLI: `aws ec2 create-image`
		1. Use AMI to launch new encrypted instances
	* Volumes restored from encrypted snapshots would be auto encrypted
* Constraints
	* Cannot directly delete the snapshot of an EBS volume attached to a registered AMI. To delete:
		1. Deregister the AMI
		1. Delete the snapshot  

### Types
1. General (API name: gp2)
	* SSD
	* IOPs (Input/output operations per second): up to 16,000
1. Provisioned IOPs (io1)
	* For databases
	* Highest performance SSD 
	* IOPs: up to 64,000
1. Throughput Optimized HDD (st1)
	* For big data & data warehouse
	* Low cost
	* IOPs: up to 500
1. Cold HDD
	* For file servers
	* Lowest cost
	* IOPs: 250
1. Magnetic (Previous gen HDD)
	* For infrequently accessed data e.g. archiving
	* IOPs: 40 - 200

### Security
* Encryption at rest
	* Not enabled by default
	* Supports client side encryption
	* Server side
		1. Encrypt using OS native encryption tools (e.g. Windows BitLocker)
		1. 3rd party volume encryption tools

## AMI (Amazon Machine Image)
* Template to launch instance, which contains OS + software packages
* Components: OS, Application Software, Launch permissions, EBS volume for hardware mappings
* AWS does not copy launch permissions, user-defined tags, or security group rules from the source AMI to the new AMI.

### Types
1. Backed by EBS
	* From EBS snapshot
1. Backed by Instance Store Volumes (ephemeral storage - lose all data upon stopped)
	* Template stored in S3
	* There would be only root EBS volume by default
	* Instance state cannot be stopped (can only reboot - data would be persisted / terminate - data would be lost)
		* It's because stopping would let 'Status Checks' fail, which would erase the contents in Instance Store
		* Reboot would not lose data

### Purchase Options
* Community AMIs
	* Free to use
	* Usually only contains OS
* AWS Marketplace AMIs
	* Comes with licensed softwares
* custom AMIs


## ENI, ENA, EFA
### ENI (Elastic Network Interface)
* A virtual network card
* A default ENI would be attached to each instance. Can add more to the instance
* Allows
	* a primary IPv4 address from VPC range 
	* secondary IPv4 addresses from VPC range
	* one public IPv4 address
	* IPv6 addresses
* Use Cases
	* Separate management network / logging network from production network
	* Network & security appliances in VPC
* You can attach a network interface to an instance 
		1. when it's running (hot attach)
		1. when it's stopped (warm attach)
		1. when the instance is being launched (cold attach)
* You can detach secondary network interfaces when the instance is running or stopped; CANNOT detach primary network interfaces

### ENA (Enhanced Networking Adaptor)
* SR-IOV: Single Root I/O Virtualization
* Speeding up network
* No charge for using ENA (assuming EC2 instance supports it)
* Options to use Enhanced Networking
	* ENA: supports network speed of up to 100 Gbps
		* Preferred option
	* VF (Virtual Function): supports network speed of up to 10 Gbps
		* Typically used on older instances
* Use cases: high throughput, 10 - 100 Gbps

### EFA (Elastic Fabric adapter)
* A network device to accelerate HPC (High performance computing) and ML apps
* Features
	* Low latency
	* High throughput
	* **OS-bypass** bypass kernel and communicate directly with the EFA device (only supported in linux)
	* better performance than ENI or ENA

## EC2 Hibernate
* OS would perform hiberation (suspend-to-disk)
	* Save RAM to EBS root volume and EBS data volumes
	* RAM needs to be < 150 GB
	* Cannot be hibernated for > 60 days
* Starting instance out of Hiberation:
	1. Amazon EBS root volume is restored to previous state
	1. RAM content would be reloaded
	1. Processes that were previously running would be resumed
* Usage
	* 'EC2' -> 'Instances' -> 'Stop - Hiberate'
* Benefits
	1. Instance boots much faster: OS does not reboot as RAM is perserved
	1. Pre-warm EC2 instances
* Constraints
	* Cannot hibernate an instance in an Auto Scaling group or used by ECS
* To pre-warm the instance
	* The instance needs to be launched with EBS


## Placement Groups
* Only certain instance types can be launched in a placement group
* Can only move a stopped instance into a placement group
* Cannot span across regions
* Creating a placement group is not free

### Types
1. Clustered Placement Group
	* Group of instances in a single AZ
	* Use case: low network latency, high network throughput within a single AZ
	* Recommends homogenous instances within clustered placement groups
1. Spread Placement Group
	* Group of instances that are each placed on **distinct underlying hardware**
	* No single point of failure
	* can only have 7 running instances per AZ
	* Use cases: small set of critical EC2 instances
1. Partitioned Placement Groups
	* Each group are divided into logical segments
		* Each segments has a rack, which has its own network and power source
		* No 2 partitions share the same racks
	* Isolate the impact of hardware failure within the application
	* Use cases: HDFS, HBase, and Cassandra


## HPC
* Achieving HPC in AWS
	* Data Transfer: Snowball, AWS DataSync, Direct Connect
	* Compute & Networking: EC2, EC2 fleet, Placement groups, Enhanced networking, ENA, EFA
	* Storage: EBS, Instance Store, S3, EFS, FSx for Lustre

## Hypervisor
* A hypervisor (or virtual machine monitor, VMM, virtualizer) is computer software, firmware or hardware that creates and runs virtual machines

### Nitro
* primarily provides CPU and memory isolation for EC2 instances
* AWS' own hypervisor; starts rolling out in 2017

### Xen
* Previous version


## Security
The key pair .pem file should be 400 before connecting to an EC2 instance. This is the AWS recommended octal permissions for a .pem file.


## ELB 
* Can only balance traffic in one region, not across multiple regions
	* Can use Route 53 to route requests to another region
* Management
	* Can be created under 'EC2' in AWS console
	* We can test the ELB by accessing the ELB's 'DNS name' from a browser
* Features
	* Do not have pre-defined IPv4 addresses; resolve to them using a DNS name
* Types
	1. Application load balancer (HTTP(s))
		* Application aware - intelligent e.g. path-based routing
		* An ALB must be deployed into at least 2 subnets.
		* Support for path-based routing, host-based routing, routing based on fields in the request, redirecting requests from one URL to another
	1. Network load balancer (TCP/TLS)
		* For configuring traffic for Internet Gateway, we can create a NLB as an internet-facing load balancer on Internet Gateway attaching to the VPC
		* Extreme performance
			* TCP and SSL listeners, millions TPS
		* Supports static IPs (i.e. can assign a static elastic IP to a NLB)
	1. Classic LB (old)
		* Layer 7 features: X-Forwarded & sticky sessions
			* X-Forwarded-For header: Contains public IP address of the end user
		* Does not support static IPs
* Responds 504 if application stops responding within the idle timeout period and gateway times out
* ELB is a foundational component of **high availability** and **fault tolerance**
* Logging
	* Access logs

### Sticky Sessions
* Allows bind a user's session to a specific EC2 instance
* Ensures that all requests from the user during the session would be sent to the same instance 

### Cross Zone Load Balancing
* Useful for regions with different amount of instances
	* e.g. 1 AZ has 5 instances while another has 1
* The Cross Zone LB would allow the traffic be evenly distributed across all instances among different AZs

### Path Patterns
* Useful for sending traffic to one ALB first and then interpret paths and direct traffic to a separate AZ for specific paths


## Autoscaling
* Definition: automation of process for adding or removing EC2 instances based on traffic demand
* Components
	* **Autoscaling Group** Logical grouping of EC2 instances for the purpose of scaling
	* Launch configuration templates
		* A launch template / config for EC2 instances
	* Scaling options
		1. Schedule
		1. Manual scaling
		1. Maintain number of instances
			* AWS would replace unhealthy instances
		1. Dynamic Scaling: triggered by rules (scaling policies - on-demand)
			* e.g. scale up with CPU utilization is over 80%
		1. Predictive Scaling (proactive scaling)
			* Scales based on forecasting
* ASG supports a mix of on-demand & spot instances
	* Can specify on-demand base & on-demand / spot ratio above the on-demand base
* Launch template
	* similar to a launch configuration, in that it specifies instance configuration information. Included are the ID of the Amazon Machine Image (AMI), the instance type, a key pair, security groups, and the other parameters that you use to launch EC2 instances. 
	* AWS strongly recommends that you use launch templates instead of launch configurations
		* defining a launch template instead of a launch configuration allows you to have multiple versions of a template
* Scaling policy types
	1. Target tracking scaling policy: on-demand
	1. Step: based on step adjustments
	1. Simple: a single adjustment
	1. Scheduled
	1. Predictive
* Scaling action
	* If multiple policy triggers
		* Follows the policy with the greater impact e.g. would use the policy that add more instances
	* Instance warm-up
		* Can specify # of secs that it takes for a new instance to warm up
		* Can
* Post-peak scale down (or scale in)
	* Termination Policy
		* specifies which instances to terminate first
	* Default Termination Policy
		* help ensure that your instances span AZs evenly for high availability after termination of certain instances
		* Termination priority: 
			1. oldest launch config > launch config > oldest launch template > launch template
			1. If multiple has the higher priority to terminate, select the ones that are closest to the next billing hour
			1. If still more than 1 from step 2, terminate a random one
	* Suspend Terminate process would block scale down.
	* Default cooldown procedure
		* Scale down every 5 minutes
	* Lifecycle hooks
		* Puts instances into a wait state before termination. During wait state users can perform custom activities to retrieve ops data from a stateful instance
		* Default wait period is 1 hour
* Lower and upper bound for number of instances can be specified
* Benefits
	* includes all benefits from ELB
	* adds scalability and elasticity

### Management
* 'EC2' -> 'Autoscaling' -> 'Create Launch Configuration' / 'Create Launch Template'
	* Basis for creating an auto scaling group
* 'Create Auto Scaling Group' based on the launch configuration / template
	* Would auto provision EC2 instances based on auto scaling settings





# Container Basics
* A package (bundle) that contains an application, libraries, runtime, and tools required to run it
	* Analogy to a VM; more like a virtual operating environment
* Components
	1. Code
	1. Libraries
	1. Env settings
	1. Virtual Kernel
* Containers run on a container engine like **Docker**
	* which is installed on OS
* Features
	* No Hypervisor
* Benefits
	* Highly scalable (scale out)
	* Fault tolerant (stateless - each component should not bring down the whole system)
	* Isolation of virtualization
	* Less overheads and faster than VMs
	* Portable; offer a consistent environment
		* Should be same on local / test / prod environment

## Docker (Container Engine)
* An open source tech which allows creating app based on Linux / Windows containers



# ECS
* A managed container scheduling and orchestration service
* Features
	1. Scheduling
		* Schedules containers for optimal placement
		* Rules can be defined for CPU & memory requirements
		* Monitors resource utilization 
	1. Supports Docker or Windows Containers
	1. Supports EC2 or Fargate instances
		* Can create VM clusters (EC2 - more control) to manage fleets of containers or use Fargate (Serverless containers)
	1. Similar to Kubernates, but deep integration with IAM, VPC, Route53, etc.
	1. Enable microservice architecture
* Permissions
	* Containers in a cluster would have access to permissions that are supplied to the container instance role
* Use cases
	* Batch processing
* Existing users
	* Amazon Sagemaker, Amazon Lex, Amazon.com's recommendation engine
* Deployment
	1. Create a docker image of the app
	1. Deploy the image as an ECS task
* Management
	1. Install docker in local machine and run `docker --version` to check
	1. Build docker image: `docker build -t {source-repo}`
	1. Create ECR to hold docker image
		1. Authenticate Docker client to the registry with CLI command
		1. Tag image: `docker tag {image}:latest {ECR-alias}:latest`
		1. Build the image locally and push to ECR: `docker push {alias}:latest`
	1. Create task definition
		1. `Clusters` -> `Task Definitions` -> `Create new` 
		1. Add container (from ECR info)
* IAM Roles
	* Cannot be assigned to EC2 level; instead, needs to be assigned to Task level
* When an ECS container instance is stopped
	- Container instance status: ACTIVE
	- ECS container agent's connection status: FALSE
* ELB
	- Both ALB and NLB support dynamic host port mapping
* X-Ray integration steps
	1. Create a docker image with X-ray daemon
	1. Assign a role to docker container instance to write to X-ray

## ECS Terms
* Clusters
	* Collection of ECS resources
* Task Definition
	* Defines the application; like a Dockerfile
	* **Container Definition**
		* inside a task definition
		* defines the individual containers that a task would use
		* can control CPU & Memory allocations
* Task
	* A single running copy 
* Service
	* Allows task definitions to be scaled by adding tasks
	* Enables autoscaling
* ECR (Elastic Container Registry)
	* Storage for container images, which can be downloaded to create containers
	* Pull docker image to local workstation: `docker pull aws_account_id.dkr.ecr.us-west-2.amazonaws.com/mydockerrepo:latest`
	* Examples
		1. ECR
			* Managed Docker container registry
			* Store, manage, and deploy images
			* Integrated with ECS and EKS
		1. Docker Hub
	* Flow
		1. Store images in ECR
		1. ECS connects to ECR and uses images to deploy e.g. Docker containers

## CodeBuild integration
* CodeBuild could extract code from e.g. CodeCommit and build a docker image
* Configuration
	1. Prepare `buildspec.yml` file to tell instructions to build, tag, and push docker image
	1. Push to CodeCommit with Dockerfile
	1. Set up CodeBuild
		1. Select source provider: CodeCommit
		1. Environment: Managed image
		1. Build specifications: Use a buildspec file
	1. CodeBuild would build and push the image to ECR

## Fargate
* Serverless container engine
	* Works with ECS and EKS (Elastic Kubernate Service)
* Features
	* Don't need to provision and manage services
	* Pay for needed resources
	* Each workload runs in its own kernel
		* Isolation and security

### Fargate vs EC2
* EC2 is good for
	* compliance requirements
	* broader customization (Fargate cannot access the instance)
	* GPUs

## ECS Features
* Free to use orchestration service & clusters

## ECS + ELB
* Supports ALB (L7), NLB (L4), CLB (L4)
* ALB enables
	* Dynamic host port mapping
	* Path-based routing
	* Priority rules

## Security
### EC2 Instance Role vs Task Role
* EC2 instance role
	* Add access policies to all tasks to the EC2 instances
	* Not ideal for PoLP (principle of least privilege)
* Task role
	* Apply policies that are needed to perform a specific task
	* Respects PoLP

## Management
* Create
	* Can create a container via templates
* Manage
	* Check 'Clusters'
	* Check task status in `running count`, `pending count`, `running count`, and `Tasks` tab




# Lambda
* Serverless Compute service. Users only need to upload code
* In Lambda’s outbound connections port 25 is blocked - no access to send email 

## Features
* will replace EC2 for the most part
* Supported languages: Java, Python, C#, Node.js, Ruby
* Bring own code - custom runtimes
* Simple resource model
	* Can choose memory from 128 MB to 10 GB (prices are proportional)
	* Allocates CPU power linearly in proportion to the amount of memory configured.
* Flexible Authorization
* Monitoring & Logging - CloudWatch
* Stateless - persist data in external storage
* Scales horizontally automatically
* Can trigger other lambda functions
* Lambda functions are independent - 1 event = 1 function triggered in an isolated instance
* Can do things globally
* Code Isolation
	- Each AWS Lambda function runs in its own isolated environment, with its own resources and file system view
- Security
	- Inbound network connections are blocked
	- Only TCP/IP and UDP/IP are supported for outbound network connections
	- stores code in Amazon S3 and encrypts it at rest
* Alias
	* Would not auto update to another version
	* `-routing-config` param allows traffic being shifted slowly from one alias to another
* Version
	* A snapshot of the code that can't be changed after creation
	- new version would be available to call within seconds
* VPC connection
	* IAM role needs `ec2:CreateNetworkInterface`, `ec2:DescribeNetworkInterfaces`, `ec2:DeleteNetworkInterface`
* Timeout
	* Maximum execution duration for a single request: 900s
	* Minimum: 1s
	* Default timeout: 3s
* Can choose the amount of memory you want for your function; proportional CPU power and other resources would be auto allocated
* Environment variables
	* Allows different config settings for different stages (e.g. dev, test, prod)
* Debugging
	1. Async
		* Lambda would auto retry 2 times for async calls; if retries fail, can create SQS DLQ for future debugging
* Lambda Edge
	* allows customization of the CloudFront contents being delivered
		* can author functions in one region and execute them in AWS locations globally closer to the viewer (reduce latency & improve CX)
* X-Ray Setup
	- Need to attach X-ray write access on Lambda execution role
* DB connection strings
	- can be stored 
		1. in SSM Param Store & be referenced by Lambda
		1. in env variable and encrypt the env var
* External dependencies
	- can be installed prior or during runtime
	- don't need to be in root folder
- Python 
	- Update lambda function via CLI
		1. `zip my-deployment-package.zip lambda_function.py`
		1. `aws lambda update-function-code --function-name MyLambdaFunction --zip-file fileb://my-deployment-package.zip`

## How to trigger lambda
1. Respond to HTTP requests from API gateways / AWS SDK
1. AWS direct triggers
	* ALB, API GW, Cognito, Lex, Alexa, CloudFront, Kinesis Data Firehose
1. Event source mappings
	* DynamoDB, Kinesis, MQ, Apache Kafka, SQS
1. S3 Event notification
	* Can invoke lambda whenever a file is uploaded 
1. Cloudwatch Events

## Accessing VPC
1. Lambda needs following information to access a private subnet
	1. Private subnet ID
	1. Security group ID
1. Adding the info to `vpc-config` parameter
	* CLI: `aws lambda update-function-configuration --function-name func --vpc-config SubnetIds=subnet-1,SecurityGroupIds=sg-1`
	* Console: `lambda` -> select function -> Scroll down and select `Network` -> select VPC from dropdown -> provide subnets & SGs
1. Afterwards Lambda uses the info to set up ENIs using an available IP address from the private subnet's CIDR range

## Benefits
* Abstraction (no server management needed)
* Flexible use
* Continous scaling
* never pay for idle; only pay for compute time

## Current issues / Constraints
* Java lambda cold start issues - hard to lower that into 400ms
    * Impact: P99 could be over 20s - API Gateway time out
    * How did cold start happen?
        * JVM allocation + handler class initialization (Boosted CPU Access could take up to 10s)
            * loaded too many classes
        * Dependency injection not front-loading all necessary classes 
        * Known values not provided leading to auto discovery
        * Reflection & classpath scanning
    * To lower cold start: 
    	* allocates more memory to lambda
    	* Remove reflection: use dagger (static DI) instead of spring/guice for dependency injection
        * Put dynamoDb initialization into static init methods
        * Use aws java sdk v2
        * Use AWSXRay to figure out the code segment contributing to the code start
        * Use lambda warmer - wake service up after a period of time
        * Check other reinvent guide: e.g. https://www.youtube.com/watch?v=ddg1u5HLwg8&ab_channel=AWSEvents
* No GraalVM Native Image
    * GraalVM: virtual machine
* Concurrent Executions Limit
	* A safety feature to limit # of concurrent executions across all functions in a region per account
	* The default TPS limit is 1,000
	* If throttled, then requests would see 429 code with `TooManyRequestsException`
	* 2 ways to mitigate
		1. Request from AWS Support Center
		1. Reserved concurrency: guarantees that a set number of executions which will always be available for critical functions

## Lambda Versions
* There is only one default version `$LATEST`
	* Can check from `Functions` -> `Qualifiers` -> `Aliases`
* Can create multiple versions and use aliases to reference the version
	* e.g. for testing, mockbank, production
	* Alias is like a pointer to a specific version (like a tag in git) 
* To invoke another version, simply call that version's ARN
	* Sample versions' ARN
		* Alias `Test` - Lambda ARN: `arn:aws:lambda:eu-west-2:{accountid}:function:mylambda:Test`
* To create a new version and an alias to point to the version
	1. New version: `Actions` -> `Publish new version`
	1. New alias: `Actions` -> `Create Alias` -> Point to the version that's being created.

	
## Best practice
1. do not put lambda in VPC
1. To lower cold start in Java
    * Remove reflection: use dagger (static DI) instead of spring/guice for dependency injection
    * Put dynamoDb initialization into static init methods
    * Use aws java sdk v2
    * Use X-Ray to figure out the code segment contributing to the code start
    * Use lambda warmer - wake service up after a period of time
    * Check other reinvent guide: e.g. https://www.youtube.com/watch?v=ddg1u5HLwg8&ab_channel=AWSEvents
1. Avoid recursions
1. External dependencies
	- Only include required libs

## Pricing
1. Number of requests
	1. First 1 million requests are always free per month
	1. 0.2 for each million requests afterwards
1. Duration of requests
1. RAM assigned


# Other Compute Services
## AWS Batch
* enables developers, scientists, and engineers to easily and efficiently run hundreds of thousands of batch computing jobs on AWS
* Automation service to help achieve HPC


## Elastic Beanstalk
* An easy-to-use service for deploying and scaling **web applications** and services on familiar servers
* Features
	* Supported languages: Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker
	* Supported servers: Apache, Nginx, Passenger, and IIS.
	* User only needs to upload their code; don't need to care about infrastructure (capacity provisioning, load balancing, scaling, and app health monitoring)
	* Would provision a new dev environment & all AWS resources needed
	* Can configure capacity provisioning & auto scaling
	* AWS provides configurations for a lot of layers, including web and database, so easy to configure a 2 tier web app
	* Monitoring & troubleshooting
		1. CloudWatch
		1. Cloudtrail
		1. Own health dashboard
* Can find Elastic Beanstalk configuration files like healthcheckurl.config, environmentvariables.config in `.ebextensions` folder
* Cannot use Lambda in E/B
* Max code zip size: 512 MB
* Update instance type
	* Create a new config file with new instance type and provision a new environment
* Packer
	* an open-source tool for creating machine images for many platforms, including AMIs for use with EC2
	* can create a custom platform and then deploy to Elastic Beanstalk
* Application version limit error
	* Can mitigate via app version lifecycle policy
* Cron
	* cron.yaml is required
	* use case: worker with periodic tasks
* Using EB CLI does not need the access to AWS console

### Configuration Files
* Can customerize the elastic beanstalk env
* YAML / JSON format
* Needs to be placed in `.config` extension and be inside a folder called `.ebextensions` in top level directory
* Does the following
	1. Define packages to install
	1. Create Linux users and groups
	1. Run shell commands
	1. Enable services and load balancer

### Deployments Options
1. All at once
	* Deployment & rollback would bring down all hosts
	* Should only be done in development / test env
1. Rolling
	* Environment capacity would be impacted as partial fleet would be unavailable during deployments / rollbacks
		* so not ideal for performance sensitive systems
1. Rolling with additional batch
	* Launches an additional batch and deploys new version in batches
	* No degraded capacity
1. Immutable
	* Deploys the new version to a fresh group of instances before deleting the old instances
	* Does not impact the live version during deployments
1. Traffic splitting
	* Deploy as immutable environment, and forwards a percentage of traffic to new version 
	* Enables canary testing


### 2 ways to integrate with RDS
1. Launch RDS from Elastic Beanstalk
	* Quick and easy
	* RDS would terminate if app terminates
1. Launch RDS outside of Elastic Beanstalk
	* preferred for prod system
	* To connect
		1. Add an additional SG rule to EC2 instances to connect to RDS instances
			* MySQL - port 3306
		1. Provide DB connection string information to application servers using Elastic Beanstalk env properties 

### Docker Containers deployment
* Options
	1. Run a single docker container on EC2 instance provisioned by Elastic Beanstalk
	1. Use Elastic Beanstalk to build an ECS cluster and deploy containers to multiple instances
* Just need to upload the code
	* Code should contain the Dockerfile (instructions to build the docker image)
	* Alternative: store code in CodeCommit and use Elastic Beanstalk CLI to fetch

### Management
* Create
	1. `Elastic Beanstalk` -> `Create App` -> Choose platform -> Upload code 



## AWS EKS (Elastic Kubernetes Service)
* Gives you the flexibility to start, run, and scale K8s (Kubernetes) applications in the AWS cloud or on-premises

### K8s
* An open-source software that lets you deploy and manage containerized apps at scale
* Containers are grouped in pods

### Why EKS?
Already using K8s and want to migrate to AWS

## Amazon Lightsail
* An inexpensive, easy-to-use, novice-friendly and interactive platform to configure and launch web apps or websites quickly
* Private virtual server

## AWS Parallel Cluster
Deploy and manage HPC clusters




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

## Data Warehousing
* For BI
* OLTP (Online Trans Processing) vs OLAP (Online Analytics Processing)
	* OLTP
		* Search via executing queries to get a row of data 
		* e.g. RDS
	* OLAP
		* Pulls large number of records + apply aggregated functions
		* e.g. Redshift

## Data Storage Types
1. Relational
	- Row, columnar 
1. Non-relational
	- Key:value
1. Graph




# S3 (Simple Storage Service)
* A cloud **bulk storage** service, where you can remotely store a large sum of data. (Similar to Google drive & dropbox)
* S3 does not reside in any VPCs; it's a global service
- Features
	- CORS
	- CRR
	- Encryption At Rest
	- Transfer Acceleration
	* Pre-signed URL
		* Can grant access to private bucket's private object
	* Notification configuration
		* Can be used to trigger Lambda functions after new objects are created
	* Key-based naming schemes for objects
		* Can grant access to the objects based on the key values specified in access tokens to specific users
	* Server access logs
		* Can be configured to send to same bucket
	* MFA
		* Can be configured in bucket policy with condition `aws:MultiFactorAuthPresent`
* Benefits
	* Fast
	* Highly scalable - unlimited storage
	* 99.99% availability & 11 9s durability
		* Reduced Redundancy Storage is the only S3 Class that does not offer 99.999999999%
* Operations
    * list
    * select
        * property selectivity
    * delete
    	* can enable MFA
* Logging can be configured and send to another bucket in this or other AWS account(s).
* path-style URLs will be eventually depreciated in favor of virtual hosted-style URLs for S3 bucket access
	* path-style URLs: https://s3.Region.amazonaws.com/bucket-name/key-name
	* virtual hosted-style URLs: https://bucket-name.s3.Region.amazonaws.com/key-name
* Resource S3 ARN must include /* at the end of the S3 bucket name to be a valid ARN.	
* Use cases
	* Content storage
	* Backup
	* Big data analytics
	* Static website hosting
		* Can be used together with CloudFront - a CDN (content delivery network)
* Components
	* Bucket (folder) name needs to be **globally unique** (because it would create a web address)
	* object (file) - unique name in the bucket
		* each object can be from 0 bytes to 5 TB
	    * components: object key (name), value, metadata, version id
	    	* key name determines which partition the file is stored in
	    * logging can be enabled to track object level activities
* Data Consistency
	* Read after Write for PUTS of new objects: be able to view directly after upload a new object
	* Eventual Consistency for override PUTS and DELETES: updating existing file could take time to propagate the change


## Storage Tiers
* A storage class represents the 'classification' assigned to each object in S3
	* The objects would be classified based on different use cases. e.g. frequency of retrieval, data classification, retention, etc.
* Storage class types 
	* Standard: frequently accessed data
		* Design: 99.99% availability, 99.999999999% (i.e. 11 9s) durability
			- SLA: 99.9% availability
		* low 
		* stored in multiple devices in multiple facilities; can sustain the loss of 2 facilities concurrently
		* the most expensive storage class
	* Standard-IA: long-lived, not frequently accessed
		* 99.9% availability, 99.999999999% (i.e. 11 9s) durability
		- retrieved weekly / monthly
		* Can have rapid access when needed 
		* Low storage fee; has retrieval fee
			- objects smaller than 128KB are billed as 128KB objects
	* One Zone-IA: long-lived, not frequently accessed, non-critical data
	* Intelligent-Tiering 
		* will have limited management fee
		* meant to change storage class based on usage and cost-efficiency
		* Minimum storage duration: 30 days
	* **Glacier** long term storage; archiving
		* Minimum storage duration: 90 days
		* $0.004/GB for storage cost
		* Retrieval 
			* Standard: within 6 hours; can configure from within minutes to hours
			* **Expedited retrieval** allows accessing data in 1 - 5 minutes for $0.03 per GB retrieved (or $10 for 1000 requests)
			* Bulk retrievals: cheapest option with 5 - 12 hours retrieval time
		* Glacier Console
			* Can access the vaults and objects in them 
	* **Glacier deep archive** is used to archive data with the intent that it will not be retrieved for long periods
		* Retrieval time: within 12 hours
		* Minimum storage duration: 180 days
		* Good for storing security & compliance data
	* S3 Outposts 
		* Deliver object storage to on-prem AWS Outpost environment
* **S3 Lifecycle Policy** 
	* helps transition objects to another Amazon S3 storage tier
		* e.g. when xxx days old, move to another tier
	* Incomplete uploads
		* Would not be deleted automatically by S3
		* Can create S3 lifecycle config to abort incomplete multipart uploads
	- Actions
		1. Filter
		1. Transition
* S3 Console can restore objects from Glacier and copy to another storage class
	* Select bucket -> select objects -> 'Actions' -> 'Edit storage class'


## CORS (Cross Origin Resource Sharing)
### Why Need CORS
* Same Origin Policy
	* A web browser permits scripts contained in a first web page accessing data in 2nd page, given that the 2 web pages have the same origin
	* This prevents Cross-Site Scripting (XSS) attacks
* Since different AWS services have different domain names, we need CORS to relax the same-origin policy in server side

### What does CORS do
* defines a way for client web applications that are loaded in one domain to interact with resources in a different domain
* Can build rich client-side web applications with Amazon S3 and selectively allow cross-origin access to your Amazon S3 resources
	* e.g. Allowing code in one S3 bucket to access / reference code in another bucket

### Use Cases
1. API GW
	* If see error message 'Origin policy cannot be read at the remote resource' on invoking HTTP calls for the URL to S3 (which invokes S3 then to API GW)
		* Enable CORS on API Gateway
		* For CORSRule AllowedOrigin domains, exact matches are needed to allow access
1. Different S3 buckets
	* Configure CORS on the destination bucket 
1. JS making authenticated GET / PUT against same/different bucket via S3 API endpoint or FNDQ
1. loading web fonts


## CloudFront Distribution
* Consists of a collection of Edge locations
* How to enable?
	* 'CloudFront' -> 'Create Distribution' -> Select 'Origin Domain Name' to S3 bucket
	* Takes 15 - 20 minutes to deploy / disable a distribution
* Invalidation
	* To remove files from being cached in edge locations
	* Can invalidate files & directorys

### HTTPS
* Can use CloudFront to redirect HTTP to HTTPS
* Can select / create `SSL Certificates` to be distributed


### CloudFront Signed URLs & Cookies (to secure authorized contents)
* A signed URL is for individual files
	* 1 URL == 1 file
* A signed cookie is for multiple files (can assign cookies to users)
	* 1 cookie == n files
* Policies are attached upon signed URL/cookie creation
* Process: User Auth -> Application generates and returns a signed URL/Cookie -> user access associated contents 
* S3 Signed URL
	* Support RTMP (Real-Time Messaging Protocol) distribution
		* On deprecation path
	* URL has limited lifetime
		* Start time is optional to specify, but need to specify end time
	* The user would be able to access the S3 bucket via signed URL
* Pre-signed URLs
	* Allow only specified customers to upload / download for a certain period of time

### To only access S3 through CloudFront URL
* Configure CloudFront origin through OAI: 
	1. `Edit Origin` -> check `Restrict Bucket Access`
	1. Create or reuse a special CloudFront user called an OAI (Origin Access Identity)
		* Check `Grant Read Permissions on Bucket` so that CloudFront can use the OAI to access the files in the bucket


## Cross Account Sharing
* 3 ways
	1. Bucket policy && IAM (Programmatic Access)
	1. Bucket ACL (Programmatic Access)
	1. IAM Role (Programmatic & Console Access)


## CRR (Cross Region Replication)
* A way to auto replicate objects across or within region(s)
* Prereq
	* **Versioning** need to be enabled on both source & destination buckets
* Features
	* Existing files would not be replicated automatically; subsequent updated files would be replicated
	* Deleting versions would not be replicated 
* Use cases
	* Disaster Recovery


## Management
1. COPY
	- `aws s3 cp {file-name} s3://{bucket-name}`
1. List
	- show buckets: `aws s3 ls`
	- show bucket's objects: `aws s3 ls {bucket-name}`
1. Move
	- `aws s3 mv {file-name} s3://{bucket-name}`
1. Sync (keep folders/buckets up-to-date)
	- upload updated files to S3: `aws s3 sync . s3://{bucket-name}` 
	- download updated files from S3 to local: `aws s3 sync s3://{bucket-name} .` 


## Multipart Download
* Can use 'Range' HTTP header in a GET request to download the specified range bytes of an object
* Able to establish concurrent connections to fetch different parts from the same object


## Multipart Upload
- Features
	1. Upload files > 5 GB
		- The largest object that can be uploaded in a single PUT is 5 GB
		- S3 object can be up to 5 TB
	1. Parallel upload of a single large object
	1. File can be divided into up to 10,000 parts
	1. All parts must be at least 5 MB (except the final part)
		- part in general should be from 5 - 100 MB
	1. Parts can be overridden by specifying a new upload with the same part number
	1. Auto-Abort
		- Can specify bucket lifecycle policy to auto abort uploads after a period of time  
- Steps
	1. Prepare - break data into pieces
		- `CreateMultipartUpload` API
	1. Move pieces
		- `UploadPart`
	1. Combine pieces into the object
		- `CompleteMultipartUpload`
* Benefits
	1. Can begin upload before knowing the final object size
	1. Quick recovery from network issues
	1. More throughput
	1. Can pause and resume uploads
* Does not improve security in transit
* Users should consider multipart upload for objects > 100 MB


## Object Locking
* Prevent objects from being deleted or modified for a period of time
	* Follows **WORM model** (write once, read many)
	* Used for compilance reasons
* Can be applied to an object or to the whole bucket
* Modes
	* Governance - needs permission to delete/overwrite rules
	* Compilance - even root account cannot delete the object for a fixed retention period
	* Legal Holds - can be deleted by any users who have **s3:PutObjectLegalHold** permission
* Glacier Vault Lock
	* Cannot be changed once updated
	- Implemented via IAM policies
	- Lock controls
		1. Time-based retention
		1. `Undeleteable`
	- Operations
		1. Initiate lock
			- Attaching a vault lock policy to the vault
			- Lock is set to an `InProgress` state and a lock ID is returned
			- Can validate the lock within 24 hours
		1. Complete lock
			- Change `InProgress` to `Locked` (immutable)
* Modificating locked objects
	* With version enabled S3 buckets, each version can have a different retention period
	* To modify a locked object, can create another version and edit on that version


## Performance
* **AWS Prefix** is the path to object excluding bucket and object
* S3 limit
	* 100 - 200 ms for GET
	* TPS limit 
		* 3500 for PUT/COPY/POST/DELETE, 5500 GET/HEAD per prefix
		* Bounded by KMS limits (encrypt & decrypt) if use SSE-KMS, where uploading & downloading would both contribute to KMS quota
			* KMS TPS limit: 5500 / 10000 / 30000 depending on region
* S3 Select
	* Retrieve only a subset of data from an object with simple SQL expressions
		- Supports CSV, JSON, Parquet, ORC, Avro
	* Up to 400% performance improvement, up to 80% cheaper
* Glacier Select
	* Run SQL queries against Glacier directly


## Permissions / Access
* default: all buckets would only be available to the owner when created
* Policies for access
	1. Object / Bucket ACL (Access Control List)
		* Permission up to individual file level
   	1. Bucket Policies
   		* JSON format
   		* Specify what actions are allowed or denied for which principals on the bucket that the bucket policy is attached to
   		* Deny would override allow in ACL 
   		* Management
   			* 'Bucket' -> 'Permissions' -> Scroll down to 'Bucket policies'
   			* Create
   				* can use 'Policy generator'
	1. Object policy
	1. IAM policies
	1. Service Control Policy (from AWS Orgnization)
* client / server authentication
* Logging
	* Access logs can be configured on bucket level to log all requests made to the S3 bucket 
		* Can be written to another S3 bucket
	* CloudTrail
* Auditing
	- Access Analyzer for S3
		- analyze access policies and generate report


## S3 Transfer Acceleration
* You have customers that upload to a centralized bucket from all over the world via CloudFront. You transfer gigabytes to terabytes of data on a regular basis across continents.
- Features
	1. Upload to edge location then upload to S3 bucket via backbone network
	1. Enabled per bucket
	1. Different endpoint from original S3 bucket
		- format: `{bucketname}.s3-accelerate.amazonaws.com`
			- for IPv6: `{bucketname}.s3-accelerate.dualstack.amazonaws.com`
- Benefits
	1. Helps end users reduce upload / download time
		- Speeds up transfer to and from S3 by 50 - 500%
- Cost
	1. US, Europe, Japan - $0.04/GB
	1. All other AWS edge locations - $0.08/GB


## Security
* All new buckets are private by default
* Encryption in Transit (SSL/TLS)
	1. Clients must support Perfect Forward Secrecy (PFS) cipher suites
		- e.g. Ephemeral Diffie-Hellman (DHE), Elliptic Curve Diffie-Hellman Ephemeral (ECDHE) 
	1. VPC endpoints
		- Provide S3 service to private subnets or restrict network traffic to just intra-VPC network space
	1. Multiple VPN options
		- AWS Site-to-site VPN Direct Connect
* Encryption at Rest (At hard-drive)
	* Can encrypt in object level & bucket level
	* Server-side (Amazon does encryption upon receiving new objects)
		* Options
			1. Server-side Encryption S3 Managed Keys (SSE-S3) stores keys
			1. SSE-KMS
				- Can use AWS-managed / customer-managed CMK
				- CMK must be symmetric
			1. SSE-C - customers' keys
		* Ways to enforce encryption on S3 buckets during uploading objects:
			1. Check the box on SSE
			1. Configure a bucket policy to only allow `PUT` requests with a request header `x-amz-server-side-encryption` with value `AES256` / `ams:kms`
	* Client-side (Encrypt and then upload; download then decrypt)
		- Options
			1. CMK in KMS
				- Application will request for the encrypted S3 object first and then call KMS to decrypt the object
			1. Application Stored key
		- Can use AWS SDK
* Bucket encryption
	* AES 256
- MFA Delete


## Versioning
* Good backup tool
* After enable versioning, each object has metadata and version Id
* Features
	* Can see different versions when clicking into the object
    * Versions may need different permissions to retrieve
    * Cannot disable; can only suspend
	* Make one version public does not make the previous versions public 
	* Supports object locking
* Versioned bucket would not be deleted immediately
	* Deleted object can be retrieved via previous versions 
	* Have the option to perminantly delete all versions at once

## Billing aspects
* Storage
* Requests (Retrieval)
* Storage Management Pricing
* Data Transfer Pricing
* S3 Transfer Acceleration 
* Cross Region Replication


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

## Security
* Provides encryption in transit & at rest
* data integration check
	* For constantly changing dataset
		* Enabling data verification all the time would lead to slow data transfer
		* Could disable veritifcation during initial file transfers and enable it during the final cut-over

## vs Storage Gateway
* Storage Gateway
	1. a Hybrid storage solution
	1. All 3 options are backed by S3
* DataSync
	1. a data migration solution
	1. Can migrate to S3, EFS, and Amazon FSx 

# DMS (Database Migration Service)
* helps migrate databases quickly and securely
	* Migration source & target options
		* On-prem -> On-prem
		* On-prem -> AWS
		* AWS -> AWS
		* AWS -> On-prem
* Features
	* Can migrate your data both to and from most of the widely used commercial and open-source databases.
		* DynamoDb is not an option for source DB
	* Support same/differnt DB type migration
* How it works
	* Same DB type: On-prem -> EC2 (running DMS) -> RDS
	* Different DB types: 
		* Need SCT (Schema Conversion Tool)
		* On-prem -> EC2 (running DMS + SCT) -> RDS (optionally to S3 before transferring to RDS)
* Benefits
	* The source database remains fully operational during the migration


# Storage Gateway
* Hybrid storage service for organizations who have stored data split between a local data center and the AWS cloud.
* Migration service to help clients onboard their current storage to AWS storage

## How it works
* The software appliance is available for download as a VM that the client can install on their data center

## Deployment types
* File gateway
 	* File gateway provides access to objects in S3 as files or file share mount points. A file gateway simplifies file storage in Amazon S3, integrates to existing applications through industry-standard file system protocols, and provides a cost-effective alternative to on-premises storage
		* Supports a file interface into S3 and combines a service and a virtual software appliance
	* Files would be stored in S3 via internet / Direct Connect / VPC
	* NFS/SMB
	* Fast response time
* Volume gateway
	* Stored as EBS snapshots (incremental backups that capture only changed blocks)
	* 2 ways 
		* stored volumes - for Backup
			* Keep the data locally in clients, and back up the data in AWS clouds 
		* cached volumes - fast access & store in cloud
			* Store S3 in primary data storage
			* Only cache actively used data
			* Create cache locally in clients, and store data in AWS clouds
			* can be available as iSCSI devices for on-prem application servers
* Tape gateway (VTL)
	* cloud-backed virtual tape storage
	* Long-term, off-site archiving
	* VTL (Virtual tape library) is more reliable than tape




# RDS (Relational Database Service)
* Relational database (SQL) service that provide a number of SQL database options
	* OLTP (online trans processing) solution
	* Reside in VPC
	* AWS maintains the underlying OS and performs software patching on the database.
* Features
	- Runs and manages multiple database engines
	* Multi-AZ - Disaster Recovery; RDS would auto update DB endpoint to another AZ if the preferred one is not available for CRUD
	* Read Replicas
	* Runs in VMs; users cannot ssh into the VMs
		- No OS access
	* Not serverless except Aurora Serverless
	* Supports Transparent Data Encryption for SQL Server
	- Logs
		- Error log
		- General query log
		- Slow query logs
	- Second level service
		- use `dig` command
* Benefits
	* low cost
	* no hardware provisioning
	* scalability
	* high availability
	* Can use ElastiCache in front of EC2 RDS instances
- To connect to MySQL instance, can get instance endpoint from
	1. `DescribeDBInstances` API / CLI / AWS console
	1. Database administrator	

## Options
* Amazon Aurora (Preferred)
* MySQL
	* default port number: 3306
* MariaDB
* PostgreSQL
* Oracle (several options)
* Microsoft SQL Server (several options)
	* up to 16TB of storage

### Aurora (Based on MySQL)
* A MySQL and PostgreSQL-compatible relational database built for the cloud
* Features
	* Autoscaling
		* Storage: from 10G to 64T
		* Compute: up to 32vCPUs & 244G RAM
	* Availability
		* At least in 3 AZs with 2 copies (6 copies in total)
	* 3 types of replicas: Aurora, MySQL, PostgreSQL
		* Auto failover is only available for Aurora replicas
* Benefits
	* Fully managed by RDS
	* up to 5 times faster than standard MySQL databases and 3 times faster than standard PostgreSQL databases.
	* Cost: 1/10 of commercial databases
	* Self-healing - auto scanning errors & correct
	* up to 15 replicas
* Backups
	* Auto backup is always enabled
	* May take snapshots
* Aurora Serverless
	* Serverless platform
	* Good for infrequent, intermittent, or unpredictable traffic pattern
	* ACU
		- Aurora Capacity Units
		- MySQL: 1 - 256 ACU
		- PostgreSQL: 2 - 384 ACU

## Backups
* Upon recovery, it would be a new RDS instance with a new DNS endpoint

### Automated
* Can recover DB to any point specific to sec in time within 'retention period' (between 1 to 35 days)
* Enabled by default
* How it works?
	* Takes a full day snapshot & daily logs everyday at a specific window and stored in S3
		* Get free space in S3 equal to DB storage space
		* In backup time window, storage I/O may be suspended & latency may increase
	* During recover, RDS would apply snapshot & apply operations based on the log

### Snapshots
* Manually
* May persist even after the RDS instance is deleted


## Relational Engine Types
1. Row based storage
	- All RDS options support except PostgreSQL
	- Good for OLTP
		- rapid transactions
		- good for low latency use case
1. Columnar storage
	- Supported by Aurora, PostgreSQL, Oracle, Redshift

## Security
* Encryption At Rest
	* Supported for all RDS options
	* Done via KMS 
	* After encrypted, snapshots, back ups, and replicas would be encrypted as well
* DB Security group
	* No need to specify a destination port number upon SG creation

## Multi-AZ (Disaster Recovery)
* Persist an exact copy of DB in another AZ
	* For disaster recovery only; not for improving performance
- Flow
	1. Block level replication
		- EBS is replicated
	1. RDS monitors DB engines, EC2 instances, EBS and EBS replication in both AZs
	1. Upon engine / EC2 / EBS fails, the RDS would wake up the engine / EC2 instance in another AZ
* Can auto switch upon planned maintenance, DB instance failure, AZ failure 
	* takes 1 - 2 min
	* SQL Server instances use SQL Server Database Mirroring (DBM) or Always On Availability Groups (AGs) instead of Amazon's failover technology
* Multi-AZ is not available to Aurora because Aurora is completely fault torelant (because of architecture)
* Free of charge

## Read Replicas (Performance)
* Persist 5 read-only copies 
	* Could have read replicas on read replicas (watch out latency)
	* Could have replica in another region
* Achieved by async replication from RDS instance to the read replica
	* Must have automatic backups turned on in order to deploy a read replica
* Enables concurrency & scaling
* Read replicas are available to all RDS options except SQL server
* When a problem is detected in the primary instance, it will NOT automatically failover to the read replica.
* Use case: read-heavy database workloads

## Performance
* For IOPS increase, users can add additional EBS SSD volumes and create a RAID 0 volume to host the database
	* RAID 0 provides performance improvements compared with a single volume as data can be read and written to multiple disks simultaneously

## Management
* Debugging
	* To find out if an error occurred, look for an Error node in the response from the Amazon RDS API
- Parameter Group
	- Manage engine parameters
- Option Group
	- Manage plugins in database engines





# Dynamodb
* Non-relational Database (NoSQL)
	* Collection == Table, Document/Item == Row, Attributes / KV pairs == fields
	* Replacement of Oracle NoSQL, Cassandra DB, and MongoDB; Amazon DynamoDB does not allow for alternative NoSQL database software options.
* Features
    * Fully managed; no visible servers
    * Stored on SSD; spread across 3 geographically distinct data centers (i.e. multi-AZ by default)
    * Serverless
    * Stores data as a JSON-like document instead of an entry
* Constraints
	* Each entry cannot store more than 400 KB
* Performance
	* DynamoDb makes use of parallel processing (sharding)
    * Divided evenly among partitions as nodes
* Caching
	* ElastiCache is not intended for use with DynamoDB (although we can); it can be used for RDS. 
	* DAX should be used
* DynamoDB auto scaling uses the AWS Application Auto Scaling service to dynamically adjust provisioned throughput capacity on your behalf, in response to actual traffic patterns
	* Enabled by default if the table / GSI is created via Console
* Use cases
	1. Needs fast response times
	1. Has specific read / write capacity requirement
	1. Web session data / metadata / JSON / BLOB / Web session data / Mobile / Gaming / IoT
* Encryption at rest
	* All DynamoDB tables are encrypted at rest using an AWS owned CMK by default. 
	* Have the option to pick an alternative AWS or Customer Managed KMS key if required.
* Cardinality
	* The # of values in a set
	* High Cardinality
		* In DB, refers to the number of unique values contained in a particular column is high
* Hot Partitions
	* A few partitions where more requests are received than the average of partitions
	* Typically happen due to low cardinality of partition key
	* Can be resolved by using high cardinality data / composite data as partition key


## API Ref
The `BatchGetItem` operation returns the attributes of one or more items from one or more tables

## Backup
* Full backups at any time
* No impact on table performance or availability
* Retained until the DB is deleted

## Consistency Options
* Eventual consistent read / write (default)
	* Consistency across all copies of data should reach within a sec
	* After writes, repeating reads after a short period of time should return the updated results eventually
* Strongly consistent reads
	* returns a result that reflects all successful writes that occurred before the read
	* slightly more latency


## Data types
- Both partition and sort keys attributes must be defined as type string, number, or binary (i.e. bytes).
- Other attributes can be Boolean, Null, Document, Set


## DynamoDb Accelerator (DAX)
* Fully managed, highly available (Multi-AZ) in-mem cache
	* only offers **write-through** option (updates cache when DB is updated)
* How it works?
	* DAX sits between application & DynamoDb
	* Points API calls to DAX cluster instead of DB
	- Eventual query & scan stores in Query cache
	- Eventual `GetItem` / `BatchGetItems` stores in Item cache
* Benefits
	* 10x read performance improvement
	* Reduces request time from milliseconds to microseconds
* Ideal for read-heavy and bursty workloads
* NOT for
	1. Strong consistency required
		- would not cache strong consistent read requests
	1. Heavy writes
	1. Do not require microseconds response times
* Cache Miss
	* DAX performs eventual consistent GET against DB


## Expressions
* Condition-expression
	* Using a condition-expression we can perform a conditional update to an item. The condition must evaluate to true; otherwise, the update operation fails
	* can use this feature to make sure the content of an article has not changed since it was last read, before we update it
* Projection expression 
	* a string that identifies the attributes that you want. To retrieve a single attribute, specify its name. For multiple attributes, the names must be comma-separated.
* Expression attribute name
	* a placeholder that you use in an Amazon DynamoDB expression as an alternative to an actual attribute name
	```
	aws dynamodb get-item \
     --table-name ProductCatalog \
     --key '{"Id":{"N":"123"}}' \
     --projection-expression "#c" \
     --expression-attribute-names '{"#c":"Comment"}' // #c is an alternative name for Comment attribute
	```
* Update expression 
	* specifies how `UpdateItem` will modify the attributes of an item
	- e.g. setting a scalar value or removing elements from a list or a map.


## Indexes
* In DB, an index is a data structure allowing fast queries on specific columns
	* Select the columns to the index and run query on the index rather than the entire dataset
	- Avoid unnecessary scan operations

### LSI (Local Secondary Index)
* Can only be created during table creation
	* cannot add, remove, or modify later
	* can create up to 5 local secondary indexes per table
* Same partition key; different sort key
	* The data in a local secondary index is organized by the same partition key as the base table, but with a different sort key
	* Any queries based on the Sort key would be much faster using the index than main table
- Components
	- Partition key, new sort key, old sort key, projected values (optional; for further lookup)
- Any data written to the table is copied Async to LSIs
- LSI is a sparse index
	- An index will only have an ITEM if the new sort key attribute is contained in the table item
		- which means the new sort key would not be Null in the index
- Retrival cost
	- If query attributes are 
		- projected: only charged for index entries
		- Not projected: items would be fetched from original table; charged for original query + **each** full ITEM in original table
		- e.g. Each full item is 1 KB, and each LSI item is 200 bytes, a query returns 5 items
			- For query with projected attributes, query size = 5 * size of LSI item = 1 kb rounded to 4kb
				- rounded to 1 RCU
			- For query with unprojected attributes, query size = 1 LSI query size + 5 full item queries = 4kb + 5 * (1KB rounded to 4 kb) = 24 kb
				- rounted to 3 RCUs for eventual consistent reads

### GSI (Global Secondary Index)
* Can create at any table
* Can issue Query requests with a variety of different attributes as query criteria against these indexes
* Can set a different partition key and sort key
* Default quota is 20 GSIs per table; can request increase
* can use Random Prefix as the partition key to avoid hot partitions and the thing wanna search as sort key
* Have separate RCU and WCU than the original table
	* WCU should at least be the same as main table in most cases; however, it depends on the partition key of the GSI

## Integration with other AWS services
- Redshift
	- Can use `COPY` command in Redshift to load data from DDB
- EMR
	- Can use Apache Hive to integrate
- S3
	- 2 way loading via Data Pipeline
- EC2
	- SDK
- Lambda
	- DDB streams


## Partitions
- Underlying storage and processing nodes of DDB
- Features
	- Initially all data in a table is stored in 1 partition
	- Users cannot directly control # of partitions for a table
		- Partitions would auto increase, but would not auto decrease if traffic reduces
	- 1 partition 
		- can store 10 GB
		- can handle 3000 RCU and 1000 WCU
- Users need to design tables to avoid I/O 'hot spots' / 'hot keys'
	- Otherwise even if users request e.g. 5000 WCU. A single hot partition would throttle requests for 1000 WCU
- Data would be distributed based on partition key if more than 1 partition
- RCU & WCU would be splitted evenly across partitions
- To determine the # of partitions
	1. Based on performance
		- number of partitions = Desired RCU / 3000 + Desired WCU / 1000
	1. Based on capacity
		- number of size = Data size / 10 GB
	1. The actual # of partitions is the Max of the performance and size partitions

## PITR (Point-in-Time-Recovery)
* What does it do
	* Protects against accidential writes
	* Restore to any point from past 5 min to last 35 days
* Not enabled by default
* Incremental backups


## Primary Keys
* primary key - identifier of an item
* Partition key (hash key)
	* Value of the Partition key is input to an internal hash function which determines the partition or physical location on which the data is stored
    * Spread table into partitions (each partition should be well distributed)
    * If only partition key is used as primary key, it needs to be unique for each entry
* Composite Key 
	* Partition Key + Sort (Range) Key
	* sort key (optional, if specified then this is part of primary key)
	    * should set to one of the most frequently searched attribute
	    * sort keys need to be unique if partition keys are the same
    		* All items with the same partition key are stored together

## Search
### Query
* A query operation finds items in a table based on the Primary Key attribute and a distinct value to search for
- needs 
	1. a key condition expression
		- a string that determines the items to be read from the table or index.
	1. specify the partition key name and value as an equality condition
* Results refine
	* Sort Key name and value 
	* `ProjectionExpression` parameter 
* Results
	* Would be sorted by Sort Key
	* Order can be reversed by `ScanIndexForward` parameter
* Consistency
	* Eventual by default
	* Can be set to Strong Consistency

### Scan
* Examines every item in the table
* Return all results by default
* Refine
	* `ProjectionExpression` parameter

### Scan vs Query
* Query is more efficient



## Streams
* Time-ordered sequence of item-level changes in a table
* Terms
	* Stream Record: contains the info about a single modification to the DB table
		* Only Primary key would be recorded by default
		* Sequence number would be assigned to stream record reflecting the sequence of the operation
	* Shards: group (container) of multiple stream records
- Features
	* Operations would be persisted in order in Stream Records; stored for 24 hours
	- Streams endpoint would be different from table endpoint
	- Modes
		1. KEYS_ONLY: only keys are in streams
		1. NEW_IMAGE: updated full item
		1. OLD_IMAGE: origin full item
		1. NEW_AND_OLD_IMAGES
- Flow
	1. Replication would be done via Elastic Beanstalk
	1. use KCL (Kinesis Client Lib) on EC2 
* Use cases
	* Cross-region replication (global tables / disaster recovery)
	* Establish relationships across tables via streams
	* Triggers e.g. Lambda
* Lambda can poll DynamoDB streams

### Global Tables
* How to create? 
	1. Create local tables
	1. enable stream
	1. setup global table via 'Global Tables' on top
* Features
	* Abstraction - no actual table, only metadata
	* Low replication latency: within 1 sec
	* data will eventually be consistent
	* Conflict: last write wins
* Constraints
	* Need stream enabled
	* Not all regions are supported


## Transactions
* Dealing with 'all-or-nothing' operations (i.e. ACID transactions)
	* Check for a pre-req condition before writing
	* Can write multiple items across multiple tables
		* Up to 25 items or 4 MB of data at the same time
* 2 underlying reads/writes - prepare/commit
* `TransactWriteItems` operation


## Throughputs
## On-demand Throughput
* Charges applied for reading, writing, and storing
	* Pay per request
* Great for unpredictable workloads

## Provisioned Throughput
* Measured in Capacity Units
* Can specify RCU & WCU
	* RCU = 1 strong consistent read of 4 KB per sec / 2 eventual consistent reads per sec
	* WCU = 1 write of 1KB per sec 
* Calculations
	* RCU = celling(data size per item / 4KB) * number of read items per sec  / (is strong consistency) ? 1 : 2
	* WCU = celling(data size per item / 1KB) * number of write items per sec
* If exceeding the throughput
	* there would be `ProvisionedThroughputExceededException`
	* SDK would auto retry until successful
- Get the consumption of read capacity
	- Can be done via setting `ReturnConsumedCapacity` in query request to `TOTAL`
		- `NONE` is the default value; `INDEX` shows the aggregated # of RCUs consumed + capacity for each table and index


## TTL
* Can set TTL to give an expiry date to the data  
- Features
	1. After you enable TTL on a table, a per-partition scanner background process automatically and continuously evaluates the expiry status of items in the table
	1. DeleteItem operation would be performed
	1. Tagged as `system delete` in DynamoDB stream
* Expired data would be marked as deleted
* For
	1. Session data
	1. Logs
	1. Temporary data
* TTL format
	* Epoch time (# of seconds elapsed from 1970 Jan 1st)
* Reduces cost automatically


## Security
* Encryption at rest via KMS
* IAM Condition can allow access only to items where the Partition Key value matches the User ID
	```
		"Condition": {
			"ForAllValues:StringEquals":{
				"dynamodb:LeadingKeys": [
					"${www.xxx.com:user_id}"
				],
				"dynamodb:Attributes": [
					"UserId",
					"xxx",
					"xxx"
				]
			}
		}
	```

## Best Practices
1. Creating tables
	1. Choose appropriate partition keys to avoid hot partitions
1. Creating LSIs
	1. Choose new sort keys based on frequently queried attributes
	1. Think about attributes being projected to save costs during queries
1. Query / Scan
	1. Reduce query / scan capacity by setting a smaller page size
	1. Can perform a larger # of small requests to allow other requests to succeed before throttling
	1. Avoid using scan
		* Because scan processes sequentially to return 1MB increments before moving forward
	1. Use parallel scans 
		* Divides table / index into segments and scan each segment in parallel
		* Avoid if table has already had heavy read / write capacity
1. Handling bursts
	1. Write
		1. Can change the application to force spreading periodic batch writes over time
		1. Can use SQS as a managed write buffer
	1. Read
		1. Caching - CloudFront / DAX


## Pricing
* If pay upfront (provisioned capacity) - cheaper read/write later e.g. costco
* On-demand
	* No minimum capacity
	* No charge for read/write
	* Cons: pay more per request than provisioned capacity
* Charges base on storage & read / write capacity






# ElastiCache
* A data caching service used to help improve speed/performance of web applications running on AWS
- Features
	* Cache in memory
		- Memory access is much faster than disk access
		- However, all data can be lost if there is a hardware failure
	- NoSQL key-value store
* Benefits
	* Speed/performance increases
	* Removes huge load from DB
* Can be used as a data store for session data
* Parameter Group
	- manage runtime settings for supported engine software
	- Parameters are used to control memory usage, eviction policies, item sizes, and more.
* Security Group
* Subnet Group

## Supports 2 open-source in-memory key-value database engines
1. **Redis** A fast, open source, in-memory data store and cache
	- Features
		1. Complex data types e.g. strings, hashes, list
		1. Can have disk persistence in addition to in mem cache at the cost of speed
		1. Can configure fall-over
	* Use cases: Advanced data types, sorting data sets, Multi-AZ, Backups, Master / slave replication, Pub/sub support
	- Cluster mode enabled vs disabled
1. **Memcached** A common memory object caching system
	* Features
		1. Multi-threading support
		1. Only supports string to string mapping
		1. Simple caching model
	* Use cases: offload DB, multi-threaded performance

## Caching Strategies
1. Lazy Loading
	* load data into cache when necessary
	* pros
		1. only requested data is cached
		1. Node failures are not fatal; there would only be cache misses
	* cons
		1. cache miss penalty - need to query for initial request
		1. stale data (out of date)
			* can be reduced by TTL
1. Write-Through
	* adds / updates data to cache whenever data is written to DB
	* pros
		1. no data stale
	* cons
		1. write penalty
		1. Node failures are fatal: data would not be updated unless a write to DB occurs
			* Can be mitigated by combining Lazy Loading
		1. resource wasted if the data is never read



# Amazon Neptune
- A fast, reliable, fully-managed **graph** database service that makes it easy to build and run applications that work with highly connected datasets
- Architecture
	1. Data is structured as nodes with edges
		- Edges are shared attributes between nodes
	1. Can reveal hidden patterns in data
- Interface languages
	1. Apache Gremlin
		- Graph structure: property
		- query pattern: traversal
	1. W3C SPARQL
		- Graph structure: Resource Description Framework (RDF)
		- query pattern: SQL
- Resource Description Framework
	1. Triple structure definition
	1. same Node, Data, Edge objects
- Use cases
	1. Security - pattern recognition
	1. Social media - targeting advertisement
	1. Science - Scientific modeling



# DocumentDB
- Fully managed auto-scaling Document Store Database Management System
- Features
	1. Great for structured / semi-structured documents - JSON / YAML
	1. Metadata is stored with document records
	1. Can hit critical scale failures
	1. MongoDB compatible
	1. JSON indexing support
- Use cases
	1. Social Media Profiles
	1. Object Catalogues
	1. Content Management Systems



# Redshift
* Fast, fully managed Cloud Data Warehouse for BI available in 1 AZ
* Features
    * A relational *database* management system (RDBMS) based on an older version of PostgreSQL 8.0.2
        * RDBMS
        * PostgreSQL
    * can query against up to 1 PB (1024 TB) stored in RedShift, and 1 EB (1024 PB) in S3
    * gives you fast querying capabilities over structured data using familiar SQL-based clients and business intelligence (BI) tools using standard ODBC and JDBC connections. Queries are distributed and parallelized across multiple physical resources.
    * Named as *RedShift* as it’s the same as the context of Universe Expansion as observed in Hubble's telescope
* Architecture
	- Node
	    - Data warehouse is a collection of computing resources (*nodes*)
	    - Node Configurations
	    	1. Single node - 160 G
	    	1. Multi node
		    	1. Leader node
		    		- has a SQL endpoint
		    			- e.g. `redshiftsample.xxx.us-east-1.redshift.amazonaws.com:5439`
		    			- To view the endpint
		    				- Redshift -> Clusters -> Choose cluster -> Configuration -> Endpoint
					- coordinates parallet query execution
						- leader nodes compiles execution plan and distribute to compute nodes
					- stores metadata
		    	1. Compute node - up to 128 nodes 
		    		- execute queries in parallel
		    		- dedicated CPU, memory and local storage
		    		- auto backups
		    		- Consists of slices
		    			- Slices are portion of mem and disk
		    			- data would be loaded to slices in parallel
		    			- processes a portion of the query
		    			- Number of slices depend on the table design & nodes
		- Node types
			1. Dense Compute
			1. Dense Storage
	- Cluster
	    * *Nodes* are organized into a group called a *cluster*
	    * Each *cluster* runs an Amazon Redshift engine and contains one or more databases running on EC2 instances
* Use cases
	* best suited for analyzing data using standard SQL and Business Intelligence(BI) tools
	* Do not use it for OLTP use cases
* Usage
    * Can setup SQL Workbench with JDBC
    * There is limited dynamic statement available for RedShift, using python might be better

## Columnar Data Store
- Redshift stores data tables as columns rather than as rows
- Benefits
	1. Avoid wasted reads if the query is on a few columns
	1. Data aggregation - compress same columns
	1. Supports compression -> save cost
		* Compress same columns (also called a column-oriented database)
		* Other compression techiques may be applied automatically
- Not for
	1. Querying specific values from a huge database
	1. Small amount of data
	1. OLTP
		- Avoid single line inserts i.e. inserting rows
	1. Binary large objects

## Enhanced VPC Routing
* Provides VPC resources access to Redshift so that Redshift can access the resources via VPC endpoints
* Before enabling, Redshift routes traffic through the internet
* After enabling, it forces all `COPY` and `UNLOAD` traffic between the cluster and data repositories through VPC

## Integration with other AWS services
- S3
	- via COPY / UNLOAD commands
		e.g. `copy {table-name} from '{s3-object-path}' credentials '{IAM-role-ARN}'`
	- can use COPY to move data from DynamoDB, EMR, and EC2
- Data Pipeline
- Database Migration Service
- Lambda
- QuickSight
- Kinesis

## Massively Parallel Processing (MPP)
* Auto distribute data & query load across all nodes
* Scaling while maintaining query performance

## Security
* In transit: SSL
* At Rest: AES-256 (keys can be managed by RedShift, KMS, or HSM)

## Backups
* Enabled by default with 1 day retention period
* Auto maintaining 3 copies (1 original, 1 replica, 1 backup in S3)
* Have option to async replicate snapshots to S3 to other regions for disaster recovery
	* Can configure cross-region snapshots

## Pricing
* depends on
	* Compute Node Hours (billed per node per hour)
	* Backup
	* Data Transfer within VPC
* Can reserve EC2 instances to save cost


# Lake Formation
- Help builds a data lake, i.e. a centralized storage



# EFS (Elastic File System)
* A regional service storing data within and across multiple AZs
	* Can access file systems across AZs and regions
	* a simple, scalable, fully managed elastic NFS file system for use with AWS Cloud services and on-premises resources
* Features
	* Can share files between thousands of Amazon EC2 instances and on-premises servers via Direct Connect / AWS VPN
	* Support NFSv4 (Network File System version 4) protocol
	* Support thousands of NFS concurrent connections
	* Read after Write consistency
* Benefits
	* High availability and durability
	* Fully managed
	* Elastic & scalable
* Usage for adding EFS to EC2
	* EFS -> 'Create EFS'
	* In EC2 instance creation, load EFS installation scripts in 'Configure Instance' -> 'Advanced Details' -> 'User Data'
	* Mount EFS system in EC2 instance via EFS helper (can find CLI command in 'EFS' -> 'EC2 Mount Instructions') 

# Amazon FSx for Lustre
* A fully managed file system that is optimized for compute-intensive workloads, such as high performance computing, machine learning, etc
	* read / write data into S3
* Features
	* Hundreds of GB per sec throughput
	* Millions of IOPs
	* sub-millisec latencies

# Amazon FSx for Windows File Server
* A fully managed native Microsoft Windows file system 
* Features
	* Can connect to Manage Active Directory
* Easily move your Windows-based applications that require file storage to AWS
	* e.g. SQL server, SharePoint, etc
* Windos FSx vs EFS
	* Windows FSx runs SMB(Server Message Block)-based file services, while EFS runs NFSv4
	* EFS is native to Unix and Linux





# SageMaker
- helps data scientists and developers to prepare, build, train, and deploy high-quality machine learning (ML) models quickly by bringing together a broad set of capabilities purpose-built for ML.
- Features
	1. purpose-built tools for every step of ML development, including labeling, data preparation, feature engineering, statistical bias detection, auto-ML, training, tuning, hosting, explainability, monitoring, and workflows.
	1. Supports ML frameworks TensorFlow, PyTorch, and mxnet


## S3 Integration
- S3 can store input and model trained from SageMaker
- Can add Amazon FSx for Lustre between S3 and SageMaker
	- Fastest file loading
- EFS
	- Can download the data from S3 to the training instance's EBS before training starts
	- Good if the size of data is not big  


# Application Integration Services
* Consumer-Producer
    * Synchronous process wastes resources & does not tolerate failure very well
    * Asynchronous process - can read / write any time

## Step Functions
### Why Need step functions
* In serverless application, creating one function might not be enough, then we need to implement more and more functions. There are different ways to combine those functions, e.g. chaining; however, what if one function fails? Thus we need a mechanism to combine different Lambda functions.
* Step Functions provides the above mechanism as well as the following features:
	1. Visualize and test serverless applications
	1. Auto triggers and tracks each step
	1. Auto retries upon errors
	1. Log the state of each step for troubleshooting 
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

### Management
* Create
	* `Step Functions` -> `State Machines` -> `Create state machine`
	* Define via ASL (JSON-based Amazon States Language)

### Best Practices
1. Specify timeout in state machine definitions
1. Consider S3 for passing large payloads between states


## SQS
* Distributed message queue system
* Can send, store, and receive messages between software components at any volume, without losing messages or requiring other services to be available
	* Pull-based, need an EC2 to pull the message 
* Pay only for transactions, but no fee for storage
* Features
	* Visibility Timeout
		* 30s by default
		* can increase up to 12 hours
			* API: `ChangeMessageVisibility`
	* Message can be in any text format
	* Guarantee at least 1 delivery
	* Can set up 2 queues for prioritization
	- Can batch message actions 
* Benefits
	* Decouple the components of an application so they can run independently
* Constraints
	1. Message size: 256 kb
	1. Size of all messages: 2 GB
		* For large messages, can use SQS Extended Client Library + AWS SDK to store the message in S3 
	1. Message max retention: 14 days; default retention: 4 days
	1. No gurantee order. Why?
		1. SQS uses multiple hosts; each holds only a portion of all messages
			* consumers would not see all hosts (messages) at once
		1. Visibility timeout not enough
	1. Eventual consistency
		* Errors due to eventual consistency can be reduced by setting **delay queues** 
			* 'DelaySeconds' can be set from 0 to 900 sec
	1. Long polling may affect performance for single instance polling multiple queues 


### Queue Types
* Standard queue
    * Messages might be partially processed by one then go back to the queue (depends on Visibility Timeout)
    * nearly unlimited TPS
    * Guarantee that a message is delivered at least once
    * Best effort deliver in order, but sometimes more than 1 copy of a message may be delivered (due to highly distributed architecture that allows high throughput)
* FIFO queue
    * serialized; slower
    * 300 TPS
    * guaranteed only one delivery to one consumer
* Since 2020, SQS can start to trigger lambda functions

### Polling messages
* Short polling 
	* returns immediately a message or nothing if the queue is empty
    * Good for single threaded application
* Long polling
	* Returns a message. If the queue is empty, wait until a message comes or time out
	* Don't need to poll repeatedly if there are no messages
	* Can save money
	* Generally preferrable
	* Max time out: 20s



## SNS
* SNS is used to automate emails and SMS messages triggered by events taking place in an AWS account.
* Features
	* PubSub pattern
		* Publisher can publish to a topic
		* Subscriber can subscribe to a topic to listen to notifications
	* Can push to Apple, Google, Windows, and fireOS devices, SMS, SQS, Email, and HTTP
    * Each message contains a single published message
    * Order not guaranteed
    * Could retry after message delivery failure
    	* Supports DLQ
    * Availability
    	* Messages being stored in multiple AZs
	* Fanout pattern 
	* Protocols
		* Email, HTTP, Email-JSON
* Benefits
	1. instantaneous push-based delivery
	1. support multiple transport protocols
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
* A cost-effective, flexible, and scalable email service that enables developers to send mail from within any application
* Features
	1. auto send and receive emails
	1. Can trigger lambda & SNS
* Use cases: automated emails, online purchases, marketing emails


## SWF (Simple Workflow Service)
* For task coordination
	* like Herd
* Tasks represent invocations of various processing steps in an app which can be performed by executable code, web service calls, human actions, and scripts
* Workflow executions can last up to 1 year
* A task is assigned only once and is never duplicated

### SWF Actors
* Workflow Starters
	* An application that can initiate a workflow (e.g. start placing an order for e-commerce website)
* Deciders
	* Control flow of activity tasks in a workflow execution
	* Decides what to do next
* Activity Workers
	* Perform activity tasks





# Management Services

## AWS Systems Manager
* Provides a unified user interface so you can view operational data from multiple AWS services and allows you to automate operational tasks across your AWS resources
* Can group resources together
	* e.g. EC2, EKS clusters, S3 buckets, RDS instances, etc.

## CloudWatch
* Manages logs, dashboard, metrics & alarms for monitoring
	* Integrated with AWS + on-prem
		- For on-prem, install CW agent on server
	* Can also create billing alarms under 'Alarms' -> 'Billing' and add SNS to send emails on alarms
* EC2: CloudWatch analyzes EC2 metrics every 5 minutes for free by default
	* Can have 1 min intervals by turning on detailed monitoring
	* Host level metrics
		* Default: CPU, Network, Disk, Status Check
		* Cannot see RAM usage in CW; can see RAM Utilization via custom metric
	* Custom metrics would be aggregated to display every 5 min if the setting of the metrics is to display every 5 min
* Provides you with data and actionable insights to monitor your applications
* Alarm
	* You can create an alarm that terminates, stops, reboots, or recovers an EC2 instance automatically when a certain threshold has been met
	* Can notify ECS cluster to scale up / down
	* Can set alarms on high-resolution metrics
		* Can specify a high-resolution alarm with a period of 10 / 30 sec
* Use cases
	* Debugging
	* Monitors performance

### CloudWatch Agent on EC2
* Configuration
	1. Configure IAM role to allow SSM (AWS System Manager) to install and configure CloudWatch agents on EC2
	1. The configuration can then be saved to the **Parameter Store** in SSM
	1. SSM can then apply the same configuration to other instances

### CloudWatch Insights
- Analysis tool to check insights

### Logs
* Retention:
	* Default: forever (even after EC2 termination)
	* Can customerize

### Cost
- Majority of cost on the size of logs emitted by the CW agent
- Query & storage cost are typically negligible

### BP
1. Create some CW insights regex to faciliate searches
1. To save cost
	1. reduce the overhead of each log statement (e.g. truncate/delete some general information)
	1. remove redundant logs
	1. remove request/response logs



## CloudTrail
* CloudTrail is a service that allows for auditing of IAM users within in AWS account.
* Features
	* Can monitor specific activities in S3 or Lambda
	* Can monitor/record AWS API calls for all the resources in AWS account
	* Delivers log files to S3, which include user identity, API call start time, source IP, request params, and response
	* Can turn on a trail across all regions
* Mainly for security analysis, troubleshooting, and resource change tracking


## X-Ray
* Features
	1. Collects data about application execution (from request handling to downstream service calling to response)
		* Can be used to trace user requests from end-to-end through the application
	1. Provide tools to analyze the data and debug production, distributed applications
	1. AWS Integration: ELB, Lambda, API GW, EC2, Elastic Beanstalk
	1. Supported languages: Java, Python, C#, Go, ...
* X-Ray Architecture
	1. X-Ray SDK in application sends JSON data to X-Ray Daemon (UDP layer)
	1. X-Ray Deamon buffers data segments in a queue and uploads them to X-Ray in batches via X-Ray API
		* thus both X-Ray SDK and Deamon are needed in the application to send data to X-Ray
* X-Ray SDK provides
	1. Interceptors to trace incoming HTTP requests

### Configuration
* Daemon
	* EC2 / On-prem: install X-Ray Daemon on the instance
	* Elastic Beanstalk: install X-Ray Daemon on the EC2 instances inside the Elastic Beanstalk env.
	* ECS: install Daemon in its own Docker container on ECS cluster alongside your app
		* X-Ray provides a Docker container image to deploy with the app
* Add SDK to app and implement data streaming to X-Ray

### Annotation & Indexing
* Annotations: allow recording additional information about requests
* Key-value pairs
	e.g. game_id=xxxxxx
* Can be indexed for use with filter expressions



## AWS Service Catalog
* Allows organizations to create and manage catalogs of IT services that are approved for use on AWS
	* Catalogs can be multi-tiered application architectures
* Allows centrally manage deployed IT services and your applications, resources, and metadata
* Use cases
	* Control permissions for different group of users to access certain parts of some AWS application stacks
* How it works?
	* Admin can create Portfolios from products (application stacks) using AWS CFN templates
	* Admin can then apply permissions and constraints for IAM users and user groups to enable access to the products


## AWS Directory Service 
### Active Directory
* Active Directory allows network administrators to create and manage domains, users, and objects within a network. 
	* e.g. an admin can create a group of users and give them specific access privileges to certain directories on the server.
* On-prem directory service
* Hierarchy: Trees & Forest

### AWS Directory Service for Microsoft Active Directory (AWS Managed Microsoft AD)
* Enables directory-aware workloads and AWS resources to use managed Active Directory in the AWS Cloud
* How it works
	* An AWS Tool providing ways to use Amazon Cloud Directory and Microsoft Active Directory with other AWS services
* Features
	* Standalone directory in cloud
	* Connect AWS Resources with on-prem AD (active directory) via VPC (over VPN or Direct Connect)
	* Can use corporate credentials; SSO 
	* Can still use 

### Simple AD
* Standalone managed directory from AWS Directory Service
	* Microsoft AD compatible
* Features
	* Limited functionality and compatibility with desired applications
	* 500 - 5000 users
* Use cases
	* Small company with simple user management requirements
* Does not support trusts i.e. using on-prem resources

### AD Connector
Connects to on-prem AD

### Cloud Directory
* non-AD Compatible service

### Cognito
* Acts as a broker that allows authenticated users to access AWS resources
* Features
	* Supports guest users
	* Supports OIDC, SAML, SAML 2.0, and social identity providers 
		* can add an OIDC IdP to user pool in console
		* API calls: `sts assume-role-with-web-identity` 
			1. Users sign in first
			1. Get token and pass token as param to the API call 
	* Not AD Compatible
	* Provides sign-up, sign-in, and guest user access
* User Pool
	* Manages user id & passwords 
	* Manages sign-up & sign-ins for mobile and web applications
	* Users can be indirectly signed in via identity providers
	* Standard attributes MUST be specified during creation of the user pool
    	* e.g. address, birthdate, email, family name, etc.
* Identity Pool
	* Place for granting Access
	* Provide temporary AWS credentials to access AWS services like S3 / DynamoDb
* Web Identity Federation (Identity Broker)
	* Can allow sign-in via other platforms such as Facebook, LinkedIn, or Google.
		1. Federated identity providers authenticate users
		1. Then Cognito identity pool provides the token to authorize the user
* Example - User tries to access AWS resources via facebook account
	1. User logins in facebook, which passes back an auth token to Cognito
	1. Cognito **User Pool** converts the auth token into a JWT token to user
	1. User sends JWT token to Cognito **Identity Pool**, which grants permission to AWS resources
- Sync
	- Streams
		- gives developers control and insight into their data stored in Amazon Cognito
		- can push each dataset change to a Kinesis stream you own in real time
	- Events
		- Raises the Sync Trigger event when a dataset is synchronized
		- Is used to invoke lambda
			- Debugging
				- `LambdaThrottledException`: should retry the sync operations
				- `LambdaSocketTimeoutException`: if lambda does not respond in 5 secs (cannot increase the timeout value)
- Rules evaluation
	- IAM role for first matching rule is used
	- `CustomRoleArn` can be specified to override the order 
- Can enable MFA on user pool
- To enforce new password when original password is compromised
	- 'Block use' for compromised credentials in Advanced Security section
* Use cases
	* Prevent the need for app to embed or store AWS credentials locally on the device 
	* Recommended for all AWS mobile applications






# Developer Tools
## CI/CD (Continous Integration / Continous Delivery)
- software development best practice
- make small changes & automate everything e.g. code integration, build, test, and deployment
- Components
	1. Continous integration e.g. CodeCommit
	1. Continous delivery e.g. CodeBuild & CodeDeploy
	1. Continous deployment e.g. CodePipeline

## Cloud9
* AWS service for providing an IDE to run, test and debug code
* Serverless

## CodeStar
* Cloud-based service for creating, managing, and working with software development projects on AWS

## CodeBuild
* a fully managed continuous integration service that compiles source code, runs tests, and produces software packages that are ready to deploy
* automated build
* eliminates the need to set up, patch, update, and manage your own build servers and software. There is no software to install or manage.
* Build logs appear in CodeBuild console, and users can also view the full CodeBuild log in CW

### To override the build command
- if have access to run the builds
	1. Set `buildspecOverride` property to the new `buildspec.yml` file
	```
	{
		...
		"buildspecOverride": "string"
		...
	}
	```
	1. Use `aws codebuild start-build --generate-cli-skeleton`
- if have access to code
	- update `buidspec.yml` and use `start-build` CLI command
- if have access to edit CodeBuild project
	* Can use `update-project` command
	* Or can update the command in Build Commands section during the build run in AWS Console 

### Management
* Create
	* Define build commands and settings in `buildspec.yml` 
		* Can override settings by adding other commands in console

## CodeCommit
* A fully-managed source control service that hosts secure Git-based repositories
* Eliminates the need to operate your own source control system or worry about scaling its infrastructure
* Can securely store anything from source code to binaries
* Notifications
	1. Configure Notifications
	1. Can create a CW events rule to send a notification to an SNS topic
* Can enable `CodeGuru Reviewer for Java`
	* automate reviews of your code to spot problems that can be hard for you to detect
	* recommendations to fix the code


## CodeDeploy
* A fully managed deployment service that automates software deployments to a variety of compute services such as Amazon EC2, AWS Fargate, AWS Lambda, and your on-premises servers.
- Deployment Preference type
	- Canary
		- 2 batches
		- e.g. `Canary10Percent5Minutes` would shift 10% traffic to new version in the first 5 minutes and shift the rest 90% after 5 minutes
	- Linear
		- Incrementally
		- e.g. `Linear10Percent5Minutes` would add 10% traffic to new version every 5 minutes. Complete traffic shifting in 50 mins.
- SSM Param Store integration
	- To enable auto deployment, use `aws ssm get-parameters` with `--with-decryption` option
- Rollback
	- If some previous files were missing, can create a new application revision / manually add those files

### AppSpec file
* Defines params being used during a CodeDeploy deployment
* Need to be in root folder
* Format
	* EC2: YAML
	* Lambda: JSON / YAML
* File strcture
	1. Version: `0.0`
	1. OS
	1. files (config + packages)
		* specifies source & destination
	1. hooks (lifecycle event hooks)
		* stages/events phases
			1. De-register from LB
				e.g. `BeforeBlockTraffic`, `BlockTraffic`, `AfterBlockTraffic`
			1. Deployment
				e.g. `ApplicationStop`, `DownloadBundle`, `BeforeInstall`, `Install`, `AfterInstall`, `ApplicationStart`, `ValidateService`
			1. Re-register with LB
				e.g. `BeforeAllowTraffic`, `AllowTraffic`, `AfterAllowTraffic`
		* can include scripts in events to
			1. unzip files
			1. test
			1. set up load balancer
* Typical folder setup
	* appspec.yml, /Scripts, /Config, /Source, ...

### Deployment Approaches
1. In-place (rolling)
	* The application is stopped on each instance and the new release is installed
	* Lambda is not supported
	1. Rolling-back needs a re-deploy
1. Blue / Green
	* New instances are provisioned and the new release is installed on the new instances
		* No capacity reduction
	* Blue - live; green - new release
	* ELB would route traffic to green
	* Rollback: set LB to point back to blue
	* Pay a bit more (need to pay 2 sets of instances during deployment)
	* For cases when you want to have two versions live simultaneously and be able to swap between the two versions.
	* Can use Route 53's weighted routing policies or E/B's swap URL feature to implement



## CloudFormation
* Provides a common language for you to model and provision AWS and third-party application resources in your cloud environment
	* CFn interprets the template and makes appropriate API calls to create the resources users have defined
* Features
	* Templates can be implemented via YAML or JSON
	* Will rollback the entire stack by default if deployment fails
		* Can disable with setting  `Rollback on failure` to No / `--disable-rollback` flag with CLI
* Benefits
	1. Consistency on resources provisioning
	1. Less time and effort than manual
	1. Version Control
	1. Free
	1. Easy rollback
* Template Strcture
	1. Params - specify custom values
	1. Conditions - e.g. provision different resources based on different conditions
	1. Resources (mandatory)
	1. Mappings - e.g. map different AMIs to different regions
	1. Transform: reference additional code (lambda or CFn) in S3 or specify the use of SAM for Lambda deployments
	1. Outputs
		* used to output user defined data relating to the resources you have built and can also used as input to another CloudFormation stack.
- cfn-init helper script
	- Can preconfigure e.g. NGINX web server
- `cfn package`
- `cfn deploy`


### CFn Drift Detection
* used to detect changes made to CFn created AWS resources outside of CFn templates
* Can run against individual stack resources / entire CFn stack / EC2 instances
* Only checks property values explicitly set by stack templates or template parameters

### Nested Stacks
- Allows re-use of common Cfn code for other use cases
- Creation
	1. Cloud a CFn template
	1. store in S3
- Can be referenced by other CFn templates in `Resources` section with type `AWS::CloudFormation::Stack`
	- `TemplateURL` specifies the S3 location of the nested stack to be used 


## CodePipeline
* Can help orchestrate and automate the various phases involved in the release of application updates in-line with a predefined release model.
* Integrated with
	1. CodeCommit, CodeBuild, CodeDeploy
	1. Cloudformation, ECS, Elastic Beanstalk, Lambda
	1. Github, Jenkins (open-source app to help build, test, and deploy applications)
- Encryption at rest
	- Ensure SSE is enabled on S3 build artifact
	- Enable encrypted at-rest on CodeBuild environment
- Action
	- An action is a task performed on an artifact in a stage
	- If an action is not performed successfully, the pipeline stops
	- Types
		1. Default action
		1. Custom action - can incorporate custom pripriety build process
- To use cross account resources
	1. Create a KMS CMK
	1. Add the key to pipeline
	1. Set up policies and roles for cross account access
- Jenkins Best Practice
	- Configure an EC2 with Jenkins installed + IAM role to access CodePipeline


## SAM (Serverless Application Model)
* Template driven Extension on CloudFormation optimized for serverless applications
	* An open-source framework to help build serverless apps
* Features
	* Simplified syntax
	* Helps debugging Lambda functions
	* Allows running serverless app locally using docker (for testing)
	* CodeDeploy integration
	* SAM CLI
* Commands
	1. `sam package` packages the app and uploads to S3
	1. `sam deploy` deploys serverless app using CFn
* Handler
	* defines the point in a Lambda function's code where execution begins


### Management
* Lambda deployment
	1. Create an S3 bucket for code storage
	1. In CFn template's `Transform` section, specify `AWS:Serverless-2016-10-31` to tell CFn that it's a SAM template
		* specify the S3 bucket in CFn template
	1. Run `sam package --template-file ./cfn.yml --output-template-file sam-template.yml --s3-bucket {bucket-name}`
	1. Run `sam deploy --template-file sam-template.yml --stack-name {stack} --capabilities CAPABILITY_IAM`

### Template format / order
1. Description. Tells CFn it's a SAM template
1. Properties across regions
1. Resources
	* Creates a lambda based on code
	* Creates API gateway and other resources
1. Output
	* Gives relevant information
1. Examples
	* `AWS::Serverless::API` is used for creating API GW resources
	* `AWS::Serverless::Application` is used to embed application from S3
	* `AWS::Serverless::LayerVersion` creates Lambda layered function
	* `AWS::Serverless::Function` describes config for creating Lambda



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
* Features
	* Monitor HTTP & HTTPS requests forwarded to CloudFront, ALB, or API Gateway
	* Includes AWS Shield
	* Can configure IP blocklisting, query strings, parameters blocking
		* Blocked requests -> 403
* WAF Blocking behaviors
	1. Allow all except specified ones
	1. Block all except specified ones
	1. Count the requests that match the properties specified
* Web Attack Protection Conditions (filter rules): IP, countries, Request header values, Request string, Request length, SQL code, Cross-site scripting
* WAF > NACL
	* Attackers may use a range of IP addresses
	* Using NACL may not keep up with the attacker
* AWS Firewall Manager
	* Centrally configure and manage firewall rules across an AWS Organization
	* Can deploy WAF rules to ALB, API Gateway, and CloudFront

### AWS Shield - mentioned in route 53
* A managed DDoS (Distributed Denial-of-service) protection service that safeguards applications running on AWS
* Protect you against Layer 3, 4, and 7 attacks
	* SYN/UDP floods
	* Reflection attacks
* Free to use, but there are additional services (Shield Advanced) at extra cost

### Amazon Macie
* PII: Personally Identifiable Information
* A fully managed data security and data privacy service that uses machine learning and pattern matching to discover and protect your sensitive data in S3
	* use AI to recognise if S3 objects contain PII
	* can also analyze CloudTrail logs
* Use case: PCI-DSS (online transaction) compliance and prevent ID theft




## KMS (Key Management Service)
* Managed service for creating and managing encryption keys (including CMKs)
* Features
	* FIPS 140-2 (US standard for cryptogram) Level 2 compliant
	* Can generate keys
		* keys can also be generated in CloudHSM
	* Can integrate with a number of AWS services and provide keys
		* e.g. S3, RDS, DynamoDb, Lambda, EBS, EFS, CloudTrail
		* S3 would be the service in which KMS could encrypt an object.
		* Integrates with CloudTrail to log KMS key events.
	* Can configure your application to use the KMS API to encrypt all data before saving it to disk
	* Key rotations
		* Can enable auto rotation taking place once a year
		* No actions are needed after enabling - KMS handles all encrypt / decrypt actions using appropriate keys
	* The `re-encrypt` API call encrypts data on the server side with a new customer master key (CMK) without exposing the plaintext of the data on the client side.
* Master keys are region-specific
	* Non trasnferrable out of the region they were created in


### CMKs
- Encrypt and decrypt data up to 4 KB in size
* Can be used for generate / encrypt / decrypt the Data Key (encrypt / decrypt data)
	- Data (envelope) key is for envelope encryption
		- For files > 4 KB
		- Encrypted data key would be stored with encrypted data
		- Can reduce network latency
			- No need to transfer the data to KMS for encryption; instead, the data key goes to the data 
* Can use an alias to refer to the CMK
* CMKs can never be exported out of KMS
* Type of CMKs (customer master keys)
	1. AWS Managed
		* Free
		* Users cannot manage, rotate, change key policies, or use them in cryptographic operations directly
	1. AWS owned
		* Used by AWS on a shared basis across many accounts
		* Does not live in a single AWS account
	1. Customer Managed
		* Allows key rotation

### Symmetric vs Asymmetric CMKs
* Symmetric
	* AES-256
* Asymmetric
	* RSA-ECC

### Key Policies
* Default: grant root user access to created keys

### Management
* Create
	1. CLI: `aws kms create-key --description "sample CMK"`
		* Returns `keyId`
	1. Can create alias and choose key material option as well
	1. Key Administrative Permissions: define the IAM users and roles that can administer (but not use) the CMK
	1. Key Usage Permissions
* View
	* CLI: `aws kms list-keys`
* Encrypt
	* CLI: `aws kms encrypt --key-id "" --plaintext file.txt --output text --query CiphertextBlob`
* Decrypt
	* CLI: `aws kms decrypt --ciphertext-blob encryptedFile --output text --query Plaintext | base64 --decode`
* Key Rotation: (every 365 days)
	* CLI: `aws kms enable-key-rotation`


## CloudHSM
* A cloud-based dedicated Hardware Security Module (HSM) that enables you to easily generate and use your own encryption keys on the AWS Cloud
* Features
	* high availability: Multi-AZ (not by default)
	* FIPS 140-2 Level 3 compliant
* KMS is multi-tenant, while CloudHSM is dedicated hardware


## ALB
* Apart from NACL blocking at network layer or WAF, ALB Security Group would block unidentified IP addresses at layer 7
* Can make EC2 Security Group to only allow traffic from ALB Security Group


## SSM (System Manager) 

### Parameter Store
* Manages and caches configuration and secrets within AWS where EC2 instances are stateless
* Features
	* Set TTL for secrets rotations
	* Organizing parameters into hierarchies via paths e.g. get prod key: /prod/path/to/key 

### Secrets Manager
* Secure, audit, and manage secrets 
	* Similar to Parameter Store
* Auto rotate secrets
	* Auto apply RDS key/passwords

### Secrets Manager vs Systems Manager Parameter Store
* Both supports
	1. Encryption at rest using customer-owned KMS keys
	1. IAM integration
	1. Can store credentials in hierarchical form
* Secrets Store
	1. Provides secure storage for config data management and secrets management
	1. charges for storing each secret 
	1. Provides a secret rotation service
	1. Can generate random secrets
* Parameter Store 
	1. no additional charges; limit: 10,000 keys & secrets



# AWS Analytics
## Athena
* Fully managed serverless interactive query service
	* Analyze and query data in S3 using SQL
	* RDMS
* Use cases
	* Query log files on S3
	* Generate busines reports
	* Analyze AWS cost reports
* Supported data formats
	* JSON, Apache Parquet, Apache ORC
* Benefits
	* No need to set up complex ETL processes
* Pricing
	* pay per query / per TB scanned

## EMR (Elastic Map Reduce)
* Big data platform
* Features
	- Managed cluster platform
	- Can read, process and analyze large amounts of data
	- Several big data frameworks & open-source projects
		- Frameworks: managed Hadoop (MapReduce programming model for distributed storage & big data) framework
		- Open-source tools: Apache Spark, Apache Hive
	- Single AZ
* Benefits
	* Half of the cost of on-prem solutions
	* x3 faster than Apache Spark
* Components
	1. Cluster: a group of interconnected EC2 instances; each instances is a node
		* Master node: manages the cluster, track job status, and monitor health
			- Features
				1. Coordinates distribution and parallel execution of MapReduce executables
				1. Tracking and directing against HDFS
				1. Resource Manager
			* Logs can be persisted in S3 every 5 minutes. 
				* This needs to be set up when the cluster is created.
		* Core node (slave node): run tasks & store data in HDFS (Hadoop Distributed File System)
			- DataNode daemon 
				- manage data blocks and I/O requests under core node
			- NodeManger
				- manage resources on core node
			- ApplicationMaster
				- work with node manager & resource manager, and execute and monitor containers
		* Task node (optional): only run tasks
			- No HDFS
		- Instance Group
			- Nodes are grouped in instance groups
			- Size limit of total instance groups: 50
				- Master node: 1 group
				- Core node: 1 or 2 groups
				- Task node: up to 48 groups
	1. HDFS
		- Distributed file system
			- allows concurrent access
		- Features
			1. High throughput
			1. Replication
				- Default replication factor is 3
				- Management
					- View factor: `hadoop fs -stat %r filename`
					- Update factor: `hadoop fs -setrep -R -w {new factor} filename`
		- Components
			1. Global Namespace
			1. Block
				- Block size
					- default block size: 64 MB
						- general block size: 64 - 256 MB
					- Large block sizes
						- minimizes random disk seeks and latency
					- Can be set per file
	1. Storage options
		1. Instance Store
			- High IOPS at low cost
		1. EBS for HDFS
			- Note that volume would not be persisted 
		1. EMRFS
			- store on S3
				- data would be persisted after termination of EMR instances
			- Features
				1. Can use EMRFS and HDFS together
					- Copy data from S3 to HDFS using S3DistCp
				1. Consistent View
- Use cases
	1. Log processing
	1. ETL
	1. Stream analysis
	1. Machine learning

### MapReduce Overview
- MapReduce is a programming model and an associated implementation for processing and generating big data sets with a parallel, distributed algorithm on a cluster
- components
	1. Input - unstructured data
	1. Split
		- Read input and split inputs into records
		- Each record is a key-value pair
	1. Map procedure
		- Data would be distributed in the cluster to nodes for processing
	1. Suffle
		- Moving intermediate KV pairs to the reducers
		- Records would be sorted and grouped based on keys in KV  
	1. Reduce method
		- Take the results from the Map phase and reduce (combine) into a single value

### Apache Hadoop
- A framework
- Features
	1. Distributed processing across clusters using simple programming models
	1. Scalibility
	1. Error detection at application layer
- YARN Architecture
	- Client -> 
	- Master node ->
		- Resource Manager: assigns the map phase the data records to start parallel processing 
	- Slave node ->
		- Node manager
		- Application master
		- Container: data processing 
	- HDFS

### EMR Architecture
- Core and task nodes are the slave nodes

## CloudSearch
Service to help set up, manage, and scale a search solution for the website and application

## Elasticsearch
Help deploy, secure, operate, and scale Elasticsearch to search, analyze, and visualize data in real-time

## Kinesis
* Help collect, process, and analyze real-time, streaming data so you can get timely insights and react quickly to new information
* Real-time data examples: purchases, stock, game data, iOT sensor data
- Benefits
	1. Real-time aggregation of data
	1. Loading data into Redshift / EMR / S3 / DynamoDB
	1. Parallel application readers

### Kinesis Data Streams
* A massively scalable and durable real-time data streaming service
* can be used to collect log and event data from sources such as servers, desktops, and mobile devices
* Features
	* can capture, transform, and load streaming data into Amazon S3, Amazon Redshift, Amazon Elasticsearch Service, and Splunk
* Model
	* Producers -> Shards (storage) -> consumers (analysis)
- Data Blob
	- the data that producer adds to a stream
	- max size is 1 MB
- Streams Record
	- Unit of data stored in a stream
	- Components
		1. Partition key
			- helps group the data by shard by telling which shard the data belongs to
			- specified by the app putting the data into a stream
		1. Sequence number
			- unique id for records in a shard
			- assigned when a producer calls `PutRecord` or `PutRecords` operations to add data to a stream
		1. User records - actual data being sent to Kinesis
* Shard 
	- a sequence (group) of data-records in a stream, each data record has a unique sequence number
	* Shard limit
		* Read
			* TPS: 5
			* Data rate: 2 MB per sec
		* Write
			* 1000 records per sec
			* Data rate: 1 MB per sec
		* Retention period: 24 hours (default) to 7 days
			- can change via CLI
	* Resharding
		* enables you to increase or decrease the number of shards in a stream in order to adapt to changes in the rate of data flowing through the stream
		* the number of instances does not exceed the number of shards
		* one worker can process any number of shards
		- Options
			1. Shard split
			1. Shard merge
- Producers
	- Options
		1. SDK Kinesis Streams API
			1. `PutRecord`
			1. `PutRecords` - recommended by AWS
		1. KPL (Kinesis Producer Library)
			- Helps write to 1 or more Kinesis Streams with an auto-retry configurable mechanism
			- Features
				1. Collects records to write multiple records to multiple shards per request
				1. Aggregation
					- Combine multiple user records into 1 Streams record
					- Shard write capacity - 1 MB / sec & 1000 Streams record / sec
					- Can combine user records to fill up the 1 MB / sec space , thus improving the throughput of each shards
				1. Collection (batching)
					- Combine multiple Streams records into a single HTTP request with `PutRecords` API operation
			- KCL integration
			- Use cases
				- inject thousands of requests per sec
			- Not suitable when
				- producer app cannot incur additional processing delay
		1. Kinesis Agent
			- Standalone java app that Kinesis provides
			- Features
				1. Monitor multiple directories and write to multiple streams
				1. Can pre-process data
					1. Multi-line record to single line
					1. Convert data to JSON format
- Consumers
	- KCL (Kinesis Consumer Library)
		- consumes and processes data
		- features
			1. Contains a Record Processor
			1. Resharding
			1. Load balancing
			1. Checkpointing
			1. De-aggregation
	* Order
		* Cannot guarantee the order across shards
		* Kinesis gives you the ability to consume records according to a sequence number applied when data is written to the Kinesis shard
	* Checkpointing - track processed records (via DDB)
		- Uses unique DDB for each app to track app state
		- As KCL uses the name of Streams app to create DDB table, application names should be unique
			- The DDB that KCL creates would have 10 WCU and 10 RCU
				- Cases where RCU/WCU is not enough
					1. Frequent checkpointing in app
					1. Too many shards
		- Each row in DDB table represents a shard 
			- Hash key is the shard id
- Loads data into S3 / ElasticSearch / Redshift / DDB
	- Can use 
		1. Kinesis Connector Library (Java)
			- Kinesis Stream -> iEmitter -> other AWS services 
		1. Spark Streaming 
		1. Lambda
			- Can auto read records from Kinesis streams and process them


### Kinesis Firehose
* reliably load streaming data into data lakes, data stores, and analytics tools
* Features
	* capture, transform, and load streaming data into Amazon S3, Amazon Redshift, Amazon Elasticsearch Service, and Splunk, enabling near-real-time analytics
	* automatically scales to match the throughput of your data and requires no ongoing administration
	* can also batch, compress (e.g. reduce storage in S3), transform, and encrypt the data before loading it
	* No storage, while KDS has
* Components
	1. Delivery streams
	1. Records of data and destinations
* Model
	* Producers -> Kinesis Firehose (lambda - capture & transform) -> S3 / Redshift / ElasticSearch
- Methods to load data into Firehose
	1. Kinesis agent
	1. AWS SDK
		- `PutRecord` / `PutRecordBatch`
- Data Transformation 
	- Flow
		1. Firehose buffers incoming data up to 3 MB
		1. Invokes Lambda to transform data async (will retry 3 times)
		1. Transformed data sent back to Firehose for buffering and then delivers to destination
	- Lambda params for transformation
		1. recordId - need to be consistent before / after transformation
		1. result - transformed record status
		1. data - transformed data payload
- Delivery
	- Buffer size (1 - 128 MB) / buffer interval (60 - 900 sec)
		- Determines how data is packed and sent to other AWS services
		- Firehose can raise the buffer size dynamically to catch up if there were errors
	- Error handling
		1. S3 - retries delivery for up to 24 hours; data would be lost if past 24 hours
		1. Redshift - retry duration can be configured between 0 - 7200 seconds from copying from S3
			- Manifest files could be created for backfilling


### Kinesis Analytics
* analyze streaming data, gain actionable insights, and respond to your business and customer needs in real time
* process streaming data in real time with standard SQL without having to learn new programming languages or processing frameworks
* Integrate with KDS & Kinesis Firehose & provide analytics on the fly
	* Analyze inside Kinesis

### Kinesis Client Library
* Runs on customer instances
* Features
	* Tracks the # of shards in stream
	* discovers new shards when reshard
	* ensures that there is a record processor for each shards
	* Manages the # of record processors relative to # of shards
	* load balances by creating record processors across consumers

### Best Practices
1. Number of consumer instances should be less than # of shards
1. Use auto scaling group with dynamic scaling on CPU utlization to help manage the # of consumer instances


## QuickSight
- A scalable, serverless, embeddable, machine learning-powered business intelligence (BI) service built for the cloud
- Features
	1. Supported data sources: 
		1. Redshift, Aurora, Athena, RDS, S3
		1. Databases in EC2 for AWS / On-prem
		1. On-prem files
		1. Salesforce
- Use cases
	1. Business Intelligence tool
	1. Marketing, sales, financial, operational data analysis


## Glue
* A serverless data integration service that makes it easy to discover, prepare, and combine data for analytics, machine learning, and application development
* can visually create, run, and monitor ETL workflows with a few clicks in AWS Glue Studio
- Can do batch processing



# Other AWS Services
## AWS Config
* used to audit and monitor configuration changes
* continuously monitors and records your AWS resource configurations and allows you to automate the evaluation of recorded configurations against desired configurations
* can notify the changes to the state of AWS environment

## AWS Elastic Transcoder
* Media Transcoder in the cloud
* Transcode video to formats that look good on each devices

## AWS IOT
- Takes data from IoT devices and write data to ElasticSearch / Kinesis Firehose / Kinesis Streams / DDB / Machine Learning
- Invokes Lambda functions
- General Flow
	1. Registray establishes identities of the devices -> 
	1. IoT device SDK helps devices transfer data via HTTP / HTTPS ->
	1. Device gateway -> 
	1. Rule engines (transforming messages) -> other AWS Services
- Components
	- Operations
		1. Control plane API
			- admin tasks
		1. Data plane API
			- sending / receiving data from AWS IoT
	- Authentication
		- Each connected devices requires an X509 cert to authenticate the device connection with AWS IoT
			- Management
				- 'IoT' -> 'Security' -> 'Certificates'
		- IAM / Cognito
			- Can attach an IOT policy to a cognito identity 
	- Authorization
		1. IoT policies
		1. IAM policies 
	- Device Gateway
		- Maintains sessions and subscriptions for all connected devices
		- Allows 1:1 and 1:many communications
		- Protocols supported: MQTT, WebSockets, HTTP
	- Device Registrary
		- A central location for storing attributes related to each thing
		- What is a Thing in IoT?
			- A physical device or logical entity
		- Management
			- 'IoT' -> 'Registray' -> 'things'
	- Device Shadow
		- JSON to store and retrieve the current state of a thing
		- Acts as a message channel to send commands to a thing
	- Rules Engine
		- Features
			1. Provide a thing the ability to interact with AWS services
			1. Transform messages via SQL based syntex and route them to AWS services
		- Management
			- 'IoT' -> 'Rules' -> Select a rule -> View 'Rule query statement' and 'Actions'



## AWS Marketplace
* A digital catalog with thousands of software listings from independent software vendors that make it easy to find, test, buy, and deploy software that runs on AWS.
* Products
	* AMI
	* CDN templates
	* Web ACL
	* AWS WAF rules

## Amazon Mechanical Turk
* Crowdsourcing marketplace for outsourcing


## AWS Migration Hub
* Used to track the progress of migrations in AWS

## AWS On-Prem Services
### SMS (Server Migration Service)
* Incremental replication of on-prem servers to AWS
* Features
	* Support migrating Hyper-V machines and VMware virtual machines
	* Allow automate, schedule, and track replications

### AWS App Discovery Service
* Helps customers plan migration projects by gathering about on-prem data centers 
* Report can be used to estimate the TCO of running on AWS


### VM Import/Export
Migrate existing virtual machines / applications in EC2

### Download Amazon Linux 2 as an ISO

## Data Pipeline
* A web service that helps you reliably process and move data between different AWS compute and storage services, as well as on-premises data sources, at specified intervals.
- Features
	1. Create an ETL workflow to automate processing and movement of data at scheduled intervals, and then terminate the resources
	1. Cross-region migration
	1. Run on EC2 instances / EMR cluster
	1. A fair amount of functionality has been replaced by Lambda
- components
	1. Datanodes
		- End destination of the data
		- Management
			- 'Data Pipeline' -> Select pipeline -> Execution Details -> 'Add' -> xxxNode
	1. Activities
		- An action that Data Pipeline initiates
		- e.g. `CopyActivity`, `EmrActivity`, `HadoopActivity`
	1. Preconditions
		- Readiness check
		- Can be applied to an activity or a data source
	1. Schedules
		- Defines time & frequency

### On-prem flow
1. Install a Task Runner package on on-prem hosts
1. Task Runner would poll the Data Pipeline for work to perform
1. Task Runner executes the commands issued by Data Pipeline


## OpsWork
* AWS OpsWorks is a configuration management service that provides managed instances of Chef and Puppet. 
	* Chef and Puppet are automation platforms that allow you to use code to automate the configurations of your servers.

### OpsWorks for Puppet Enterprise
* A fully managed configuration management service that hosts Puppet Enterprise, a set of automation tools from Puppet for infrastructure and application management
* Features
	* Allow managing applications and servers on AWS / on-prem. 
	* Can model application as a stack containing different layers

## AWS Quick Start
* A bunch of CFn templates already built by AWS Solutions Architects allowing users to start AWS developments quickly

## Amazon Rekognition
* Video/image analysis
* can identify objects / people


## AWS Security Center
A central location from which you can receive security updates and where you can report any security concerns


## AWS Service Health Dashboard
* displays the general status of AWS services
* up-to-minutes



## AWS Snowball
* A petabyte-scale data transport solution that uses secure appliances to transfer large amounts of data into and out of the AWS cloud
* Uses hardward appliance to transfer data 'physically' instead of via internet
* Addressed challenges including
	* high network costs
	* long transfer times
	* security concerns
* Can import to / export from S3 
* Use cases
	* Transfer 50 TB ~ 80 TB of data to S3

### Snowball Edge
* 100 TB appliance with compute capability



## Amazon Workspaces
* DaaS
* provision either Windows or Linux desktops in just a few minutes




# Billing
## AWS Organizations
* Can manage policies from a master AWS account to other accounts for security and compliance purposes.
* Allows managing billing for multiple AWS accounts
	* Consolidated billing - one bill for all accounts
* Organizational Units (OU) i.e. department specified in AWS cloud
* Free to all AWS customers
* Can enjoy pricing benefits from aggregated usage (volume discounts)

### Moving the master account from AWS Org A to B
1. Remove all member accounts from A
1. Delete Org A
1. Invite the master account of A to be a member of B

### Moving an account from AWS Org A to B
1. Remove account in A
1. B sends an invite to the account

### Service Control Policies
* A type of organization policy that you can use to manage permissions in your organization
* SCPs offer central control over the maximum available permissions for all accounts in your organization
* Parent OU deny policy would override any child OU allows

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
* Saving Plans
	* Commitment to a consistent amount of usage for 1 - 3 years
	* Compute Saving Plan
		* Can save up to 66%
		* Auto applies to Fargate, EC2, and lambda
	* EC2 instance saving plan 
		* does not apply automatically to Fargate
		* vs Reseved instances
			* Saving plans
				* Preferred option recommended by AWS
				* Savings over on-demand
				* Can reduce billing even when usage reduces
				* Flexibility
					* Can change the instance size within the same instance family
			* Reserved instances
				* Less flexibility
				* Do not save Fargate cost
	* Management
		* 'AWS Cost Explorer' -> 'Savings Plans'

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




# HA Architecture
* Designs for Failure
* Good Example for HA
	* Health checks
	* Back up
	* Multiple AZs
	* Fault tolerance


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



# Cloud Best Practices
* Design for failure
* Loose coupling
* Think Parallel
* Implement 'Elasticity'
* Build security in every layer
* Don't fear constraints
* Leverage different storage options



# Other Notes

## Caching
* CloudFront (lazy-loading), API Gateway (lazy-loading), ElastiCache (lazy-loading, write-through), DynamoDb Accelerator (write-through)
* Senario
	* CloudFront -> API Gateway -> Lambda -> ElastiCache 
	* Earlier stage of caching is, lower the latency would be


## Microservices Architecture
* Lambda, ECS, API GW


## Native feature supports
### Encryption at Rest
* EFS
* EBS
	* Uses KMS CMKs when creating encrypted volumes and any snapshots
		* A unique AWS-managed CMK is created for user automatically in each region
* S3 
	* SSE
		* SSE-C, SSE-S3 (AES-256), SSE-KMS, or a client library such as Amazon S3 Encryption Client
		* Can enforce upload encryption via bucket policy
	* Client-side encryption can use AWS Encryption SDK 
* Kinesis
	* Can enable SSE via KMS CMK for Data Firehose
	* When Kinesis Streams are chosen as source, encryption is auto enabled

### Native Multi-AZ
S3, SQS & DynamoDB are already built in a fault tolerant fashion, not need to provision these services across multi AZs.


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

## Additional Resources
1. FAQs
	* Main ones: Lambda, DynamoDB, S3, IAM, ECS, SQS
	- ML main ones
		1. Data engineering
			1. Data storage: Lake formation, S3, FSx for lustre, EFS
			1. Data ingestion: Glue, Apache Kafka, Kinesis
			1. Data transformation: EMR with Apache spark, Glue, Athena, SageMaker + Apache spark
		1. Data analysis
			1. Sanitize and prep data for modeling: SageMaker Ground Truth
				- Examine the data
					- the dimensions of the data (column - # of features, row - # of data)
					- Correlations between features
					- Stats (descriptive, informative)
				- Prepare
					- Data augmentation
				- Sanitize
					- ensure each column does not contain multiple features
					- Handle missing data
			1. Feature engineering
				1. Dimensionality reduction e.g. PCA, T-distributed stochastic neighbor embedding
				1. Transformation (for numerical features)
				1. Convert categorical data into numerical data
			1. 
		1. Modeling
1. Re:Invent videos
1. Whitepapers

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


## Strategies
1. Read and understand the question before reading answer options
1. Identify key phrases and qualifiers
1. Anticipate the answer before looking at answer choices
1. Eliminate options based on what we know about the question / topic
