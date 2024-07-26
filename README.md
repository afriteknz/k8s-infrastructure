#### Setting up & provisioning Kubernetes (EKS/AKS) Cluster with Terraform.
- This repo will exlpore kubernetes components & concepts.
- CI/CD approaches (pull and push-based) for deploying kubernetes resources & microservices applications.


Note** - This solution is based on Azure Kubernetes Service (AKS) and Amazon Elastic Kubernetes Service (Amazon EKS). While the core concepts are universally applicable, there are slight variations in implementations across different Kubernetes environments.

#### Highlevel deployment steps.

```
1. Deploy EKS/AKS Infrastructure using Github actions CI/CD pipelines inside the subfolders infrastructure-aks/infrastructure-eks. 
2. Bootsrap ArgoCD with Terraform using Github actions CI/CD pipelines inside the subfolders aks-argocd-boostrap/eks-argocd-boostrap
3. After step 2 completes, ArgoCD is now accessible and you can deploy your apps directly using the ArgoCD GUI or using the method defined in this README.md 

```
---

#### What inspired this repo? 

My journey into the world of containers and container orchestrators has been quite eventful. I began my career in IT back in 2010, working for an organization that fully embraced open-source solutions. This meant that any problem we encountered had to be solved using open-source tools. We were a Java shop, and I worked alongside three Java & Python developers who built applications that we hosted on either Apache, Nginx, Tomcat or Glassfish.
 
As a Linux Administrator responsible for deploying the code into dev, uat and production environments, I faced challenges such as, 

```
- Difficulty in mantaining similar environments across all developers 
- Slow shipping of applications 
- Development environments that differed from production environments 
- Lack of automation, manual code deployments (Jenkins came around 2011)

```

Unfortunately, Docker wasn't available at the time (Docker came around 2013), and the best solution we had for addressing these issues was to rely more on traditional approaches and tools.

- Interwoven bash scripts that were difficult to troubleshoot.
- Virtualization, which helped create isolated environments to some extent. 

Over the years (from 2010 to the present day), I worked in various capacities as a Linux Administrator (2010 - 2012), NOC Engineer(2012 - 2015), Systems Engineer (2015-2017), Team Lead cloud (2017 to 2022) for 3 different Internet Service Providers (ISPs).

 In 2022, I made the decision to immigrate from Zimbabwe to New Zealand, where I secured a position as a Senior Cloud Engineer, and I have been in this role since then. 

In my current role, my primary focus is on assisting organizations with,


- Cloud Architecture & DevOps Engineering - Deploy platform (management, connectivity) & application (workloads) landing zones
 to Azure & AWS using Terraform, Azure DevOps Pipelines & Github actions (60% of my work)
- Consultancy - Assisting customer partnership leads with presales support by assessing clients' IT infrastructure 
and determining migration pathways using the cloud adoption framework.



Upon joining my current employer, I volunteered to be part of an AWS EKS project where the client needed a multi-account/cluster solution. My strong background in Linux administration (RHCE), as well as my experience with Azure/AWS (Architect/Engineering) environments, made it easy for me to justify my involvement in the project.

Given the complexities of that project with regards to 


 - General architecture of the infrastructure [AWS EKS accounts, vpc architecture, secrets management etc]
 - Containerisation of the application,
 - Automation of application deployment,
 - Automation of infrastructure deployment
---

#### Design Choices/Considerations 

**Why poly repo structure**

  QQ: Should you store your #kubernetes manifests in the same repo with your #application code? If you want to store them in the same repo, why?

   - does the same team own both parts of the application/cluster.

  QQ: Mono repo vs poly repo?

  QQ: Branches or no branches for application release?

    While you are thinking please read 
    - https://cloudogu.com/en/blog/gitops-repository-patterns-part-1-introduction
    - https://medium.com/@mattklein123/monorepos-please-dont-e9a279be011b
    - https://medium.com/@adamhjk/monorepo-please-do-3657e08a4b70
    - https://codefresh.io/blog/stop-using-branches-deploying-different-gitops-environments/
    - https://codefresh.io/blog/how-to-model-your-gitops-environments-and-promote-releases-between-them/
    - https://www.infracloud.io/blogs/monorepo-ci-cd-helm-kubernetes/
    - https://argo-cd.readthedocs.io/en/stable/user-guide/best_practices/
    - https://developers.redhat.com/articles/2022/09/07/how-set-your-gitops-directory-structure#directory_structures

--- 


**GitOps Repo Architecture strategy/structure**

Q: When bootstrapping an EKS cluster, when should GitOps take over? 

Use Terraform for infra, GitOps for apps; clearer separation of concerns. 

- Terraform creates cluster, worker pools, boostraps ArgoCD
- Helm for deploying application workloads



- EKS & AKS infrastructure deployment using terraform - https://github.com/afriteknz/k8s-infrastructure (this repo)
- k8s manifests - https://github.com/afriteknz/k8s-manifests
- Argo GitOps terraform boostrap files for both EKS & AKS
- Applications repo. (Each application has its own repo and where it makes sense, 2 different microservices can be bundled together)

```
- Multi repo - (Github - You can also use Azure repos)
- GitOps - Pull-based CI/CD - (ArgoCD - you can also use FluxCD for this)
- CI/CD - (Github Actions  - you can also use Azure DevOps or Jenkins)

```

Bootstrapping ArgoCD with terraform

https://www.reddit.com/r/kubernetes/comments/m96gx1/does_anyone_use_terraform_to_manage_kubernetes/
https://www.reddit.com/r/Terraform/comments/1de6184/when_bootstrapping_an_eks_cluster_when_should/


---

#### Running microservices applications on EKS/AKS
 
Seperate repositories will store different Microservices applications in Java, C#, PHP, Python, and other modern languages. 

After deploying the EKS/AKS infrastructure, the next step is hosting the applications.

    - Application Development
    - Containerisation with Docker + Docker-Compose
    - Kubernetes (EKS/AKS)
    - Packaging with Helm
    - CI/CD pipeline with GitHub actions
    - GitOps with Argo CD (I will also look at flux later on)
    - Observability & Monitoring with Prometheus and Grafana
    - Infrastructure as Code with Terraform (deployment of the infrastructure)

    Additionally, I will explore 

    - Various types of supported Ingress controllers 
    - CNI plugins
    - Service mesh - Istitio

---


**Why CI/CD with GitOps**

GitOps is an operating model for cloud-native applications that stores application and declarative infrastructure code in Git to be used as the source of truth for automated continuous delivery. With GitOps, you describe the desired state of your entire system in a git repository, and a GitOps operator deploys it to your environment, which is often a Kubernetes cluster. For more information 

BLUEPRINT - https://learn.microsoft.com/en-us/azure/architecture/example-scenario/gitops-aks/gitops-blueprint-aks


The example scenario in this article is applicable to businesses that want to modernize end-to-end application development by using containers, continuous integration (CI) for build, and GitOps for continuous deployment (CD). In this scenario, a Flask app is used as an example. This web app consists of a front-end written using Python and the Flask framework.


GitOps Architecture references

- https://developers.redhat.com/articles/2022/09/07/how-set-your-gitops-directory-structure#
- https://developers.redhat.com/e-books/path-gitops
- https://developers.redhat.com/articles/2022/07/20/git-workflows-best-practices-gitops-deployments
- https://akuity.io/blog/argo-cd-architectures-explained/
- 

---

**GitOps Architecture**

Option 1 - Push-based CI/CD approaches

![alt text](/img/ci-cd-gitops-github-actions-aks-push.png)


Push-based architecture with GitHub Actions for CI and CD.

Dataflow

This scenario covers a push-based DevOps pipeline for a two-tier web application, with a front-end web component and a back-end that uses Redis. This pipeline uses GitHub Actions for build and deployment. The data flows through the scenario as follows:

    1 - The app code is developed.
    2 - The app code is committed to a GitHub git repository.
    3 - GitHub Actions builds a container image from the app code and pushes the container image to Azure Container or Docker Registry.
    4 - A GitHub Actions job deploys, or pushes, the app, as described in the manifest files, to the Azure Kubernetes Service (AKS) cluster using kubectl or the Deploy to Kubernetes cluster action.

Option 2: Pull-based CI/CD (GitOps)

![alt text](/img/ci-cd-gitops-github-actions-aks-pull.png)


Dataflow

This scenario covers a pull-based DevOps pipeline for a two-tier web application, with a front-end web component and a back-end that uses Redis. This pipeline uses GitHub Actions for build. For deployment, it uses Argo CD as a GitOps operator to pull/sync the app. The data flows through the scenario as follows:

    1 - The app code is developed.
    2 - The app code is committed to a GitHub repository.
    3 - GitHub Actions builds a container image from the app code and pushes the container image to Azure Container Registry.
    4 - GitHub Actions updates a Kubernetes manifest deployment file with the current image version based on the version number of the container image in the Azure Container Registry.
    5 - Argo CD syncs with, or pulls from, the Git repository.
    6 - Argo CD deploys the app to the AKS cluster.

Components

    - GitHub Actions is an automation solution that can integrate with Azure services for continuous integration (CI). In this scenario, GitHub Actions orchestrates the creation of new container images based on commits to source control, pushes those images to Azure Container Registry, then updates the Kubernetes manifest files in the GitHub repository.
    - Azure Kubernetes Service (AKS) is a managed Kubernetes platform that lets you deploy and manage containerized applications without container orchestration expertise. As a hosted Kubernetes service, Azure handles critical tasks like health monitoring and maintenance for you.
    - Azure Container Registry stores and manages container images that are used by the AKS cluster. Images are securely stored, and can be replicated to other regions by the Azure platform to speed up deployment times.
    - GitHub is a web-based source control system that runs on Git and is used by developers to store and version their application code. In this scenario, GitHub is used to store the source code in a Git repository, then GitHub Actions is used to perform build and push of the container image to Azure Container Registry in the push-based approach.
    - Argo CD is an open-source GitOps operator that integrates with GitHub and AKS. Argo CD supports continuous deployment (CD). Flux could have been used for this purpose, but Argo CD showcases how an app team might choose a separate tool for their specific application lifecycle concerns, compared with using the same tool that the cluster operators use for cluster management.
    - Azure Monitor helps you track performance, maintain security, and identify trends. Metrics obtained by Azure Monitor can be used by other resources and tools, such as Grafana.

---

#### Docker - Where does docker fit in all this?


The diagram below shows the architecture of Docker and how it works when we run “docker build”, “docker pull” and “docker run”. 

![alt text](/img/docker.png)
 
There are 3 components in Docker architecture: 
``` 
🔹 Docker client - the docker client talks to the Docker daemon.  
🔹 Docker host - the Docker daemon listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes.  
🔹 Docker registry - A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use.
```
 
Let’s take the “docker run” command as an example. 
```
1. Docker pulls the image from the registry. 
2. Docker creates a new container. 
3. Docker allocates a read-write filesystem to the container. 
4. Docker creates a network interface to connect the container to the default network. 
5. Docker starts the container. 
```

Docker is a platform that enables developers to build, ship, and run applications in containers. Containers are lightweight, portable, and self-sufficient environments that encapsulate all the dependencies required to run an application.

Key Components:

```

- Docker Engine: The core component of Docker, responsible for building, running, and managing containers. It consists of:

- Docker Daemon: The background process that manages containers, images, networks, and volumes.
- Docker CLI: The command-line interface used to interact with Docker Daemon.
- Images: Read-only templates that contain the application code, runtime, libraries, dependencies, and other files required for the application to run.
- Containers: Runnable instances of Docker images. Containers isolate the application and its dependencies from the underlying infrastructure, ensuring consistency across different environments.
- Dockerfile: A text file that contains instructions for building Docker images. It specifies the base image, environment variables, dependencies, and commands needed to set up the application environment.

```

Key Concepts:

```

- Containerization: The process of packaging an application and its dependencies into a container. This allows the application to run consistently across different environments, from development to production.
- Layered File System: Docker uses a layered file system to optimize image builds and minimize storage space. Each instruction in a Dockerfile creates a new layer, making it possible to reuse existing layers when building new images.
- Networking: Docker provides networking capabilities to enable communication between containers and other networked services. Users can create custom networks to isolate containers or connect them to external networks.
- Volumes: Docker volumes provide persistent storage for containers. Volumes enable data to persist even after a container is stopped or deleted, making them suitable for storing application data, logs, and configuration files.

```

Use Cases:

```

- Application Deployment: Docker simplifies the deployment process by encapsulating applications and their dependencies into containers. This enables developers to deploy applications more efficiently and consistently across different environments.
- Microservices Architecture: Docker is well-suited for building and deploying microservices-based applications. Each microservice can be packaged into a separate container, allowing for better scalability, isolation, and maintainability.
- Continuous Integration/Continuous Deployment (CI/CD): Docker facilitates the adoption of CI/CD practices by providing a consistent environment for building, testing, and deploying applications. Docker images can be automatically built, tested, and deployed using CI/CD pipelines.
- Development Environments: Docker can be used to create lightweight, reproducible development environments. Developers can use Docker to quickly set up development environments 

```
---

#### Cloud based Kubernetes (EKS/AKS) Architectures

- Master nodes for control plane operations
- Worker nodes for executing application workloads


Leveraging Terraform to automate the provisioning of an Azure Kubernetes Service (AKS) cluster! 🌐💡

In this project, I focused on automating the deployment of various resources to support the AKS cluster enhancing security and isolating network resources using a Service Principal. 

The deployment unfolded in the following key steps:
```
- 1️⃣ Virtual Network Creation: A secure space for hosting the AKS cluster, ensuring isolation from other network resources.
- 2️⃣ Azure Container Registry: Ensuring secure and private container image management.
- 3️⃣ Azure Key Vault: A centralized vault to securely store sensitive information like client secrets.
- 4️⃣ AKS Cluster Setup: Configuration of nodes for running containerized applications, with specifications defined using 

```
---

#### Kubernetes Architecture, Components and Concepts

![alt text](/img/k8arch.png)

Namespaces 

In Kubernetes, #namespaces are the linchpin for organizing and securing resources within a unified cluster, crucial for upholding structure and safeguarding data in multi-tenancy setups.

Multi-tenancy where each customer is running the same instance of a vendor application, although the data being used in the app is completed isolated from other. 

In this example, ![alt text](/img/image.png)

by changing the namespaces within the #Kubernetes manifest, different instances of an application can be deployed, ensuring that each tenant operates within their own isolated environment or domain, effectively managing resources and maintaining security in a multi-tenancy setup.

Exposing your microservices to external traffic – ClusterIP vs NodePort vs LoadBalancer vs Ingress

ClusterIP: Inside the Cluster Walls

```At the foundation of Kubernetes services lies ClusterIP. As the default service type, ClusterIP provides internal communication between applications within the same cluster. Notably, ClusterIP services are not accessible from outside the cluster. However, there’s a twist — the Kubernetes proxy can come to the rescue.```

Takeaways
- To gain access to ClusterIP services, the Kubernetes proxy can be initiated using the command kubectl proxy --port=8080
- Mostly used for debugging, internal communication, and selective access.

NodePort: A Direct Connection

```This service type exposes a specific port on all cluster nodes (VMs), effectively forwarding external traffic to the intended service.```

While NodePort simplifies external exposure, it does have limitations:

    Limited to one service per port.
    Constrained port range (30000–32767).
    Management of potential changes in Node/VM IP addresses.

NodePort is a suitable choice for temporary applications, demos, or scenarios where constant availability isn’t a strict requirement.

Takeaways
- 
- 

LoadBalancer: Bridging the Gap

```LoadBalancer shines as the standard method for direct service exposure. Traffic on the specified port flows seamlessly to the service, accommodating a range of protocols including HTTP, TCP, UDP, Websockets, and gRPC. However, convenience comes at a cost: Each LoadBalancer-exposed service is assigned a unique IP address, which can lead to increased expenses.```

Takeaways
- 
- 

Ingress: The Intelligent Path

```Ingress takes a distinct approach by acting as an intelligent gateway. Unlike the previous methods, Ingress isn’t a service type; rather, it serves as a frontend for multiple services, enabling advanced routing scenarios. Ingress offers a plethora of possibilities, with various Ingress controllers available. The default GKE Ingress controller sets up an HTTP(S) Load Balancer, which supports intricate path and subdomain-based routing.```

Takeaways
- 
- 


---

#### 3 stage CI/CD pipeline 

![alt text](/img/cicd.png)

---

#### Bootstrapping ArgoCD With Terraform

ArgoCD takes over the responsibility of ensuring that the desired state of the applications aligns with the actual state of the cluster.

    ArgoCD acts as a centralized controller, continuously watching the Git repository for updates to application manifests. When changes are detected, ArgoCD triggers the necessary actions to synchronize the cluster with the desired state, ensuring that applications are always deployed in the intended configuration.

High Level Overview 

![alt text](/img/gitOpsOverview.png)

What is Bootstrapping?

    Bootstrapping is to make your system ready by ensuring it loads your essential components
    In Kubernetes, we have options to bootstrap the cluster with several examples:
        Having ingress controller, prometheus operator, and telemetry collector
        Having applications management / delivery tools installed like ArgoCD or FluxCD
    In this case we want to bootstrap ArgoCD to the cluster, so that for all the remaining components can be managed using Application or ApplicationSet in ArgoCD


Why Bootstrapping?

    Bootstrapping will only contains the minimum essentials tools get installed
    This will make the cluster management less painful
    We can manage the essentials tools altogether with cluster provisioning definition
    We can separate the other essentials tools management into different layer (for ArgoCD, using Application or ApplicationSet)


How to Bootstrapping Kubernetes Cluster?

    Terraform widely known tools to provisioning Kubernetes cluster
    It has Helm provider support
    Helm chart is versioned and more easier than dealing with plain manifests
    We can leverage Terraform and Helm to bootstrap the cluster
    So we can manage the cluster provisioning (using whatever your cloud platform is), and manage the essentials components (in this case ArgoCD)

NB - Folders aks-argocd-bootstrap and eks-argocd-bootstrap contain terraform code to bootstrap the AKS/EKS clusters respectively.

--- 

##### Performance optimization is all about three things

1. Cost Optimization
2. Kubernetes Resource Optimization
3. Worker Node Optimization

---