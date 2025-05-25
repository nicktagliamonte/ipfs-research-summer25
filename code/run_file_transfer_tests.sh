#!/bin/bash

NODES=(ipfs-node1 ipfs-node2 ipfs-node3 ipfs-node4 ipfs-node5 ipfs-node6 ipfs-node7 ipfs-node8 ipfs-node9 ipfs-node10)
RESULTS_FILE="transfer_results.txt"

# Clear old results
echo "IPFS File Transfer Test Results" > "$RESULTS_FILE"
echo "=================================" >> "$RESULTS_FILE"
echo "" >> "$RESULTS_FILE"

MP4_FILE=".resources/Video MP4_Road - testfile.org.mp4"
REMOTE_PATH="/data/testfile.mp4"

# Copy the mp4 file to all nodes
for node in "${NODES[@]}"; do
  docker cp "$MP4_FILE" "$node:$REMOTE_PATH"
done

# Loop through every pair of nodes
for src_node in "${NODES[@]}"; do
  echo ">>> Adding file from $src_node" | tee -a "$RESULTS_FILE"

  # Add file and capture CID and time
  ADD_OUTPUT=$(docker exec "$src_node" sh -c "time -p ipfs add $REMOTE_PATH" 2>&1)
  CID=$(echo "$ADD_OUTPUT" | grep 'added' | awk '{print $2}')
  ADD_TIME=$(echo "$ADD_OUTPUT" | grep real | awk '{print $2}')

  echo "CID: $CID" | tee -a "$RESULTS_FILE"
  echo "Add time: ${ADD_TIME}s" | tee -a "$RESULTS_FILE"
  echo "" >> "$RESULTS_FILE"

  for dst_node in "${NODES[@]}"; do
    if [ "$src_node" != "$dst_node" ]; then
      echo "Testing retrieval from $src_node -> $dst_node" | tee -a "$RESULTS_FILE"

      # Try to retrieve the file and measure time
      RETRIEVE_OUTPUT=$(docker exec "$dst_node" sh -c "time -p ipfs cat $CID > /dev/null" 2>&1)
      CAT_TIME=$(echo "$RETRIEVE_OUTPUT" | grep real | awk '{print $2}')

      # Check if the file was retrieved successfully
      if echo "$RETRIEVE_OUTPUT" | grep -q 'real'; then
        echo "Retrieved successfully in ${CAT_TIME}s" | tee -a "$RESULTS_FILE"
      else
        echo "Retrieval failed" | tee -a "$RESULTS_FILE"
      fi
      echo "" >> "$RESULTS_FILE"
    fi
  done

  echo "------------------------" >> "$RESULTS_FILE"
done

echo "Test complete. Results saved to $RESULTS_FILE"
