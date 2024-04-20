### This repo documents my kubernetes Journey focusing on general architecture concepts and specific eperience with EKS & AKS journey

#### What inspired this repo 

How many can confidently say they understand the Kubernetes ecosystem? Probably just a few. To address this, I've decided to meticulously document my experiences with Kubernetes. This documentation will serve as a valuable reference for all my future projects involving Kubernetes, particularly those based in the cloud, such as AKS and EKS.

Ultimately, my goal isn't necessarily to master every aspect of Kubernetes. Instead, I aim to understand kubernetes core fundamentals enough to be able to host microservices developed in either Java, C#, PHP, Python and any of the morden languages.

This practical approach guides my efforts, prioritizing operational effectiveness over exhaustive comprehension.

#### Kubernetes Architecture

- Master nodes for control plane operations
- Worker nodes for executing application workloads



#### I have broken down this repo into 4 subfolders folders

##### EKS Platform
- Contains terraform code to deploy EKS infrastructure on AWS.
##### EKS Applications
- Contains different microservice applications in C#, Java springboot, node & Python
##### AKS Platform
- Contains terraform code to deploy EKS infrastructure on Azure.

Excited to share insights into my latest project leveraging Terraform to automate the provisioning of an Azure Kubernetes Service (AKS) cluster! 🌐💡
In this project, I focused on automating the deployment of various resources to support the AKS cluster enhancing security and isolating network resources using a Service Principal. The deployment unfolded in the following key steps:
1️⃣ Virtual Network Creation: A secure space for hosting the AKS cluster, ensuring isolation from other network resources.
2️⃣ Azure Container Registry: Ensuring secure and private container image management.
3️⃣ Azure Key Vault: A centralized vault to securely store sensitive information like client secrets.
4️⃣ AKS Cluster Setup: Configuration of nodes for running containerized applications, with specifications defined using Terraform for automatic scaling and adaptability.
🔗 Check out the GitHub repo https://lnkd.in/dyJG4f_M for a detailed look into the project architecture and configurations.
#Terraform #Azure #AKS #DevOps #CloudComputing #InfrastructureAsCode #Containerization
Excited to hear your thoughts and feedback on this journey! Let's continue pushing the boundaries of automation and secure cloud deployments. 💻🌐
Feel free to customize it further to match your personal style and preferences!


##### AKS Applications
- Contains different microservice applications in C#, Java springboot, node & Python


#### For both EKS and AKS, you need 2 things:

    - A cluster
    - A way to deploy workloads into the cluster


##### History Lesson ###################




##### Docker?

Docker is a platform that enables developers to build, ship, and run applications in containers. Containers are lightweight, portable, and self-sufficient environments that encapsulate all the dependencies required to run an application.

Key Components:

Docker Engine: The core component of Docker, responsible for building, running, and managing containers. It consists of:

Docker Daemon: The background process that manages containers, images, networks, and volumes.
Docker CLI: The command-line interface used to interact with Docker Daemon.
Images: Read-only templates that contain the application code, runtime, libraries, dependencies, and other files required for the application to run.

Containers: Runnable instances of Docker images. Containers isolate the application and its dependencies from the underlying infrastructure, ensuring consistency across different environments.

Dockerfile: A text file that contains instructions for building Docker images. It specifies the base image, environment variables, dependencies, and commands needed to set up the application environment.

Key Concepts:

Containerization: The process of packaging an application and its dependencies into a container. This allows the application to run consistently across different environments, from development to production.

Layered File System: Docker uses a layered file system to optimize image builds and minimize storage space. Each instruction in a Dockerfile creates a new layer, making it possible to reuse existing layers when building new images.

Networking: Docker provides networking capabilities to enable communication between containers and other networked services. Users can create custom networks to isolate containers or connect them to external networks.

Volumes: Docker volumes provide persistent storage for containers. Volumes enable data to persist even after a container is stopped or deleted, making them suitable for storing application data, logs, and configuration files.

Use Cases:

Application Deployment: Docker simplifies the deployment process by encapsulating applications and their dependencies into containers. This enables developers to deploy applications more efficiently and consistently across different environments.

Microservices Architecture: Docker is well-suited for building and deploying microservices-based applications. Each microservice can be packaged into a separate container, allowing for better scalability, isolation, and maintainability.

Continuous Integration/Continuous Deployment (CI/CD): Docker facilitates the adoption of CI/CD practices by providing a consistent environment for building, testing, and deploying applications. Docker images can be automatically built, tested, and deployed using CI/CD pipelines.

Development Environments: Docker can be used to create lightweight, reproducible development environments. Developers can use Docker to quickly set up development environments 

##### Namespaces 


In Kubernetes, #namespaces are the linchpin for organizing and securing resources within a unified cluster, crucial for upholding structure and safeguarding data in multi-tenancy setups.

Multi-tenancy where each customer is running the same instance of a vendor application, although the data being used in the app is completed isolated from other. 

In this example, ![alt text](images/image.png)

by changing the namespaces within the #Kubernetes manifest, different instances of the #webRTC application can be deployed, ensuring that each tenant operates within their own isolated environment or domain, effectively managing resources and maintaining security in a multi-tenancy setup.

Below are a list of benefits you get when you take advantage of namespaces in Kubernetes

- Isolation: Separates teams or clients, maintains resource and access control.

- Resource Management: Efficiently allocates and manages CPU, memory, storage.

- Security: Ensures precise access control and data privacy.

- Quotas and Limits: Enforces resource quotas, prevents exhaustion.

- Customization: Tailors configurations to specific requirements.

- Monitoring and Logging: Simplifies monitoring, offers better insight.

- Scaling and Upgrades: Facilitates seamless scaling, minimizes impact.


##### Performance optimization is all about three things

1. Cost Optimization
2. Kubernetes Resource Optimization
3. Worker Node Optimization


#### 