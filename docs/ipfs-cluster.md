# ipfs-cluster

## Purpose
IPFS Cluster is a tool for orchestrating and managing pinsets across multiple IPFS (Kubo) nodes. It provides coordinated, automated, and policy-driven pinning, replication, and monitoring of content in distributed IPFS deployments. Cluster enables high-availability, redundancy, and scalable data management for large-scale or collaborative IPFS use cases.

## Key Concepts
- **Pinset Consensus**: Maintains a global, distributed set of pinned CIDs using consensus algorithms (Raft, CRDT).
- **Cluster Peers**: Each peer runs alongside an IPFS node, participating in consensus and pin orchestration.
- **Replication Factor**: Configurable number of replicas for each pinned CID across the cluster.
- **REST API**: Exposes HTTP endpoints for cluster management, pinning, and monitoring.
- **Consensus Backends**: Supports Raft (leader-based) and CRDT (conflict-free replicated data type) consensus for pinset state.
- **Follower Peers**: Lightweight peers that follow and replicate pinsets from a leader or template.
- **Metrics & Monitoring**: Tracks health, status, and resource usage of cluster peers and underlying IPFS nodes.
- **Allocator Plugins**: Customizable logic for pin placement and resource allocation.

## Key Directories & Packages
- `/third_party/ipfs-cluster/cmd/ipfs-cluster-service`: Main cluster peer binary (sidecar to Kubo)
- `/third_party/ipfs-cluster/cmd/ipfs-cluster-ctl`: CLI client for interacting with the cluster REST API
- `/third_party/ipfs-cluster/cmd/ipfs-cluster-follow`: Follower peer binary for replicating pinsets
- `/third_party/ipfs-cluster/api/`: HTTP API definitions and handlers
- `/third_party/ipfs-cluster/consensus/`: Consensus backends (Raft, CRDT)
- `/third_party/ipfs-cluster/state/`: Pinset state management
- `/third_party/ipfs-cluster/allocator/`: Pin allocation strategies and plugins
- `/third_party/ipfs-cluster/monitor/`: Peer and IPFS node monitoring
- `/third_party/ipfs-cluster/test/`: Integration and unit tests

## Notable Features & Usage Patterns
- Deploy as a sidecar to Kubo nodes for coordinated pinning and replication
- Use `ipfs-cluster-ctl` to add, remove, and query pins across the cluster
- Configure replication factors and pin allocation policies
- Monitor cluster health, peer status, and pinset convergence
- Use REST API for automation and integration with external systems
- Support for dynamic membership, peer addition/removal, and failover
- Follower peers for simplified, template-based replication

## Project Status & Roadmap
- Actively maintained and widely used for large-scale IPFS deployments
- Ongoing development for improved scalability, CRDT support, and operational tooling
- Roadmap includes enhanced metrics, new consensus options, and better integration with Kubo and Helia
- See [IPFS Cluster Roadmap](https://ipfscluster.io/roadmap/) and [News](https://ipfscluster.io/news/)

## Potential Research Hooks
- Measure cluster state convergence and pinset consistency under churn
- Experiment with custom allocator plugins and pinning strategies
- Analyze consensus performance (Raft vs. CRDT) in different network conditions
- Study failure recovery, peer join/leave, and data durability
- Integrate with Helia or other IPFS implementations for hybrid clusters
- Simulate large-scale clusters for benchmarking and stress testing

## References
- [IPFS Cluster Homepage](https://ipfscluster.io/)
- [IPFS Cluster GitHub](https://github.com/ipfs-cluster/ipfs-cluster)
- [Documentation](https://ipfscluster.io/documentation/)
- [REST API Reference](https://ipfscluster.io/documentation/reference/service/)
- [Raft Consensus](https://raft.github.io/)
- [CRDT Concepts](https://crdt.tech/)
