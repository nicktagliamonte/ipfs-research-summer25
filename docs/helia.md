# helia

## Purpose
Helia is a modern, modular, and browser-friendly JavaScript/TypeScript implementation of the IPFS protocol. It aims to provide a lean, flexible, and high-quality IPFS experience for web, Node.js, and service worker environments, replacing the deprecated js-ipfs. Helia is designed for extensibility, composability, and ease of use in decentralized applications.

## Key Concepts
- **Content Addressing**: Uses CIDs (Content Identifiers) for immutable, verifiable data storage and retrieval.
- **Merkle DAG**: Data is structured as a Merkle Directed Acyclic Graph, supporting efficient linking and versioning.
- **libp2p Networking**: Peer-to-peer communication, DHT-based routing, and pubsub for distributed data exchange.
- **Bitswap Protocol**: Core data exchange protocol for requesting and serving blocks between peers.
- **Pluggable APIs**: Modular packages for UnixFS, JSON, DAG-JSON, DAG-CBOR, MFS, IPNS, and more.
- **Browser & Node Support**: Runs in browsers, service workers, browser extensions, and Node.js.
- **Custom Hashers**: Supports pluggable hashers for content addressing.
- **Delegated Routing**: HTTP Routing v1 support for browser-friendly delegated DHT queries.
- **Mutable File System (MFS)**: Provides a POSIX-like mutable filesystem abstraction on top of IPFS.
- **IPNS**: Naming system for mutable references to content.

## Key Directories & Packages
- `/third_party/helia/packages/helia`: Main peer-to-peer Helia implementation (uses bitswap, libp2p, HTTP gateways)
- `/third_party/helia/packages/interface`: Defines the Helia API
- `/third_party/helia/packages/bitswap`: Bitswap protocol implementation
- `/third_party/helia/packages/unixfs`: UnixFS file system API
- `/third_party/helia/packages/json`, `/dag-json`, `/dag-cbor`: IPLD block storage for JSON, DAG-JSON, and DAG-CBOR
- `/third_party/helia/packages/strings`: Simple string storage/retrieval
- `/third_party/helia/packages/mfs`: Mutable File System (MFS) implementation
- `/third_party/helia/packages/ipns`: IPNS naming and resolution
- `/third_party/helia/packages/interop`: Interoperability test suite
- `/third_party/helia/packages/http`: Lightweight HTTP gateway-only implementation
- `/third_party/helia/packages/car`: CAR file support (Content Addressed Archives)

## Notable Features & Usage Patterns
- Add/get data as strings, JSON, DAG-JSON, DAG-CBOR, or UnixFS files
- Compose Helia with custom libp2p, blockstore, and datastore backends
- Use in browser via script tag or npm
- Example: `createHelia()` + `unixfs(helia)` for file operations
- Supports custom hashers (e.g., SHA-512) for advanced use cases
- Interop with go-ipfs and other IPFS implementations

## Project Status & Roadmap
- Helia v1 released in March 2023; ongoing development for performance, delegated routing, and browser adoption
- Focus on modularity, adoption, and deprecating legacy js-ipfs
- Roadmap includes delegated routing, improved browser support, and community-driven features

## Potential Research Hooks
- Benchmark Bitswap and DHT performance in browser vs. Node.js
- Experiment with custom hashers and their impact on CID uniqueness
- Study interoperability with go-ipfs and other IPFS stacks
- Explore delegated routing and HTTP gateway fallback in constrained environments
- Investigate MFS and IPNS for collaborative, mutable data sharing
- Analyze security/trust models in Helia’s modular architecture
- Extend Helia with new IPLD codecs or storage backends
- Simulate multi-node Helia clusters for distributed experiments

## References
- [Helia Homepage](https://helia.io/)
- [Helia GitHub](https://github.com/ipfs/helia)
- [API Docs](https://ipfs.github.io/helia)
- [Helia Examples](https://github.com/ipfs-examples/helia-examples)
- [Bitswap Protocol](https://docs.ipfs.tech/concepts/bitswap/)
- [IPFS Concepts](https://docs.ipfs.tech/concepts/)
