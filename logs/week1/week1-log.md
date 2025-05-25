# Week 1 Log: May 16-21, 2025
## IPFS Independent Study - Weekly Progress Report

### Weekly Overview
This week marked the beginning of my IPFS independent study. I focused on establishing basic knowledge, environmental setup, and conducting initial experiments with IPFS. By creating a small private IPFS network, I was able to observe how content addressing, distributed storage, and peer-to-peer data transfer function in practice.

### Key Accomplishments
- Deployed a 10-node IPFS cluster using Docker
- Mapped and documented the content resolution flow through the IPFS network
- Conducted performance testing on file transfers between nodes
- Analyzed system resilience under various failure conditions
- Explored core theoretical components (Merkle DAGs, Kademlia DHT, libp2p)

### Technical Deep Dives

#### Infrastructure Architecture
The test environment consists of 10 Docker containers running Kubo (go-ipfs) nodes connected in a private swarm. Each node has:
- Externally mapped API (5001), Gateway (8080), and Swarm (4001) ports
- Persistent storage volumes mounted at `./ipfs-data/nodeX`
- Custom bootstrapping configuration to form a closed network
- Monitoring hooks for performance metrics collection

This setup was achieved using Docker Compose, with manual bootstrapping via `ipfs swarm connect` to ensure node connectivity.

#### Protocol Exploration
Through code review and experimentation, I investigated several core IPFS components:

1. **Content Addressing**: The CID system creates unique identifiers derived from content hashes. Testing confirmed identical files added to different nodes receive the same CID.

2. **Distributed Hash Table**: The Kademlia-based DHT uses XOR distance metrics and k-bucket organization to achieve O(log n) content lookup. Each node maintains more information about nearby keys and nodes through k-buckets.

3. **Data Structures**: Merkle DAGs handle content chunking, linking, and verification. Analysis of the `.ipfs/blocks` directory revealed how files are split into ~256KB chunks.

4. **Networking Layer**: libp2p handles peer discovery, transport, connection security, and multiplexing. Tests confirmed it manages all node-to-node communication.

#### Performance Analysis
Performance testing across the node cluster revealed several patterns:

| Operation | Minimum Time | Maximum Time | Average Time |
|-----------|--------------|--------------|--------------|
| File Add (1MB) | 0.76s | 24s | 8.2s |
| File Retrieval | 0.01s | 0.04s | 0.02s |
| Node Discovery | 0.8s | 3.2s | 1.6s |
| DHT Query | 0.4s | 1.2s | 0.7s |

Node-to-node latency testing showed most intra-cluster communication with sub-millisecond latency (0.01-0.5ms), while two nodes (ipfs-node1 and ipfs-node9) displayed higher latency (100-280ms).

#### Storage and Persistence
I examined storage patterns in `.ipfs/blocks` and `.ipfs/datastore` before and after operations:
- Tested pinning and unpinning to understand content persistence 
- Triggered garbage collection and observed space reclamation effects
- Found that most nodes showed a small decrease in `/data/ipfs/blocks` size after GC
- Confirmed that unpinned content becomes unavailable after garbage collection

#### System Resilience
Testing system behavior under failure conditions revealed:
- Content remained retrievable with progressive block deletion on individual nodes
- Network isolation (by clearing `Addresses.Swarm` and removing `Bootstrap` addresses) prevented content access as expected
- Deleting blocks on one node didn't affect retrieval if other nodes maintained the content

### Challenges Encountered
- Performance inconsistency: Large unexplained variations in operation timing across seemingly identical nodes
- Network configuration: Initial Docker networking faced IP allocation conflicts
- Some nodes showed consistently higher latency than others (100-280ms vs 0.01-0.5ms)

### Key Learnings
1. **Distributed Redundancy**: IPFS's design ensures content remains available even when individual nodes lose data or go offline
2. **Content-Addressing**: Hash-based addressing enables verification, deduplication, and location-independent retrieval
3. **DHT Efficiency**: Kademlia's XOR metric and bucket structure achieves O(log n) lookups in a distributed environment
4. **Data Flow Architecture**: The chunking → hashing → local storage → Bitswap → DHT pipeline forms the core operational model

### Next Week's Plan
- Develop automated testing scripts for measuring performance under controlled network conditions
- Explore IPFS Cluster for coordinated pinning and replication policies
- Investigate MFS (Mutable File System) for applications requiring updatable content
- Test larger file transfers and examine chunking behavior with varied content types

### Questions for Further Research
1. **Performance Variability**: What causes the significant disparity in add times across seemingly identical nodes?
2. **Peer Selection Logic**: How does IPFS determine which peer to fetch from when multiple nodes have the same content?
3. **Resource Optimization**: What configuration parameters most directly impact memory usage, disk I/O, and network efficiency?
4. **Datastore Management**: Does the datastore ever fully clear after garbage collection, or does it maintain minimal state permanently?

### References & Resources
- [IPFS Documentation](https://docs.ipfs.tech/)
- [IPFS Whitepaper](https://arxiv.org/pdf/1407.3561)
- [Kubo GitHub Repository](https://github.com/ipfs/kubo)
- [Kademlia Paper](https://pdos.csail.mit.edu/~petar/papers/maymounkov-kademlia-lncs.pdf)
- [LibP2P Specification](https://github.com/libp2p/specs)
