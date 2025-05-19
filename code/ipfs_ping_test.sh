#!/bin/bash

# Number of pings per peer
PING_COUNT=5

# Number of peers to sample per node
SAMPLE_SIZE=3

NODES=(ipfs-node1 ipfs-node2 ipfs-node3 ipfs-node4 ipfs-node5 ipfs-node6 ipfs-node7 ipfs-node8 ipfs-node9 ipfs-node10)

for NODE in "${NODES[@]}"; do
  echo "=== Testing node: $NODE ==="
  
  # Get swarm peers for this node
  PEERS=$(docker exec -i $NODE ipfs swarm peers | shuf -n $SAMPLE_SIZE)
  
  if [ -z "$PEERS" ]; then
    echo "No peers found for $NODE"
    continue
  fi

  # Loop over sampled peers and ping
  while IFS= read -r PEER; do
    # Extract just the peer ID (last part after /p2p/)
    PEER_ID=$(echo $PEER | sed -E 's|.*/p2p/([^/]+)$|\1|')
    echo "Pinging $PEER_ID from $NODE"
    
    # Ping the peer, limiting to $PING_COUNT pings
    docker exec -i $NODE ipfs ping -n $PING_COUNT $PEER_ID
    
    echo "-----"
  done <<< "$PEERS"
  
  echo ""
done
