# kubo

## Purpose
Kubo (formerly go-ipfs) is the original and most widely used implementation of the IPFS protocol, written in Go. It provides a robust, production-grade, and feature-rich IPFS node for distributed, content-addressed storage and retrieval. Kubo is designed for reliability, interoperability, and extensibility, serving as the reference implementation for the IPFS network.

## Key Concepts
- **Content Addressing**: Uses CIDs (Content Identifiers) for immutable, verifiable data storage and retrieval.
- **Merkle DAG**: Data is structured as a Merkle Directed Acyclic Graph, supporting efficient linking, deduplication, and versioning.
- **libp2p Networking**: Peer-to-peer communication, DHT-based routing, NAT traversal, and pubsub for distributed data exchange.
- **Bitswap Protocol**: Core data exchange protocol for requesting and serving blocks between peers.
- **UnixFS**: File and directory abstraction for storing files in IPFS.
- **HTTP Gateway**: Serves IPFS and IPNS content over HTTP, supporting both trusted and trustless retrieval.
- **HTTP RPC API**: `/api/v0` endpoint for programmatic control and automation.
- **Command Line Interface (CLI)**: Full-featured CLI for node management and data operations.
- **WebUI**: Web-based user interface for managing and monitoring the node.
- **Content Blocking**: Node operators can configure content filtering and blocking.
- **Delegated Routing**: HTTP Routing v1 support for delegated DHT queries and lookups.

## Key Directories & Packages
- `/third_party/go-ipfs/cmd/ipfs`: Main binary entrypoint for the Kubo daemon and CLI
- `/third_party/go-ipfs/core/`: Core node logic, lifecycle, and API
- `/third_party/go-ipfs/commands/`: CLI command definitions and handlers
- `/third_party/go-ipfs/routing/`: DHT, delegated routing, and related logic
- `/third_party/go-ipfs/blocks/`, `/repo/`, `/config/`: Block storage, repository, and configuration
- `/third_party/go-ipfs/docs/`: Developer and user documentation
- `/third_party/go-ipfs/test/`: Integration and unit tests
- `/third_party/go-ipfs/plugin/`: Plugin system for extending node functionality

## Notable Features & Usage Patterns
- Run as a background daemon or single-shot CLI tool
- Add, retrieve, and pin files using CLI or HTTP API
- Serve content via HTTP Gateway (trusted and trustless modes)
- Participate in the public IPFS DHT for peer discovery and content routing
- Use delegated routing for browser and constrained environments
- Configure custom blockstores, datastores, and plugins
- Interoperate with other IPFS implementations (Helia, Rust, etc.)
- Monitor and manage node via WebUI or API

## Project Status & Roadmap
- Kubo is the reference and production-grade IPFS implementation
- Ongoing development for performance, scalability, and protocol compliance
- Roadmap includes improved delegated routing, enhanced gateway features, and modularization
- See [Kubo milestones](https://github.com/ipfs/kubo/milestones) and [docs/ROADMAP.md] if available

## Potential Research Hooks
- Benchmark Bitswap, DHT, and routing performance under various network conditions
- Experiment with custom blockstores, datastores, and plugin extensions
- Study interoperability with Helia and other IPFS stacks
- Analyze gateway trustless retrieval and content verification
- Explore delegated routing and HTTP Routing v1 in hybrid deployments
- Investigate content blocking and filtering mechanisms
- Simulate multi-node clusters for distributed experiments
- Profile resource usage and optimize for constrained environments

## References
- [Kubo Homepage](https://docs.ipfs.tech/how-to/command-line-quick-start/)
- [Kubo GitHub](https://github.com/ipfs/kubo)
- [API Docs](https://docs.ipfs.tech/reference/kubo/rpc/)
- [CLI Reference](https://docs.ipfs.tech/reference/kubo/cli/)
- [HTTP Gateway](https://docs.ipfs.tech/concepts/ipfs-gateway/)
- [IPFS Concepts](https://docs.ipfs.tech/concepts/)
