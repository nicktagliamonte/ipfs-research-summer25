# Exploring the InterPlanetary File System (IPFS):  
## A Systems and Research-Oriented Independent Study

**Student**: Nick Tagliamonte  
**Instructor**: Professor Justin Shi  
**Term**: Summer 2025 (May 15 – August 8)  
**Credits**: 3  

---

## Overview

The InterPlanetary File System (IPFS) is a content-addressed, peer-to-peer protocol for decentralized file storage and retrieval. Designed as a resilient and permanent alternative to HTTP, IPFS decouples file identity from location and distributes data across a global mesh of nodes.

This independent study investigates IPFS from both a systems engineering and distributed computing perspective, combining protocol analysis, practical experimentation, and contextual research. The ultimate goal is to build technical insight into decentralized web infrastructure and explore IPFS’s real-world viability.

---

## Scope and Objectives

The project will focus on the following areas:

- **Protocol Architecture**  
  Understand how IPFS leverages Merkle DAGs for content addressing, libp2p for modular networking, and Kademlia DHTs for peer-to-peer routing.

- **Systems Behavior**  
  Explore data persistence, replication, consistency, and peer discovery mechanisms in a decentralized environment.

- **Performance and Fault Tolerance**  
  Evaluate behavior under node churn, constrained bandwidth, and high latency to assess scalability and resilience.

- **Security and Reliability**  
  Investigate trust models, content authenticity, and resistance to adversarial threats like content poisoning and Sybil attacks.

- **Contextual Research**  
  Survey literature and technologies relevant to IPFS, including Web3 storage platforms (e.g., Filecoin, Swarm, Tahoe-LAFS), to situate its role in the decentralized web ecosystem.

---

## Deliverables

- **Weekly Research Log**  
  A version-controlled log capturing progress, design notes, experimental findings, and key takeaways.

- **IPFS Node Cluster Deployment**  
  A testbed of IPFS nodes configured under different network conditions, with metrics collection for performance and behavior analysis.

- **Prototype Application**  
  A lightweight, practical demonstration of IPFS usage — such as decentralized file hosting, collaborative data sharing, or resilient content delivery.

- **Final Technical Report or Presentation**  
  A summary of architectural insights, experimental results, and identified questions or bottlenecks for further exploration.

---

## Repository Layout

.  
├── code/ # Scripts, tools, and prototype implementations  
├── logs/ # Daily research logs and observations  
├── notes/ # Protocol dissection, diagrams, lit reviews  
├── install/ # Installation scripts, setup guides  
└── README.md # This file  