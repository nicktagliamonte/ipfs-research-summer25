from bitcoinrpc.authproxy import AuthServiceProxy

# Example 3-3 modernized to use AuthServiceProxy instead of raw_proxy
rpc_user = "nicktagliamonte"
rpc_password = "Nrajl800."
rpc_port = 8332  
rpc_host = "127.0.0.1"
# Create the RPC connection using AuthServiceProxy
rpc_url = f"http://{rpc_user}:{rpc_password}@{rpc_host}:{rpc_port}"
rpc_connection = AuthServiceProxy(rpc_url)
blockchain_info = rpc_connection.getblockchaininfo()
print(blockchain_info['blocks'])

# Adding from example 3-4, modernized:
txid = "0627052b6f28912f2703066a912ea577f2ce4da4caa5a5fbd8a57286c345c2f2"
# These segments regarding block height and hash are added because I don't have blocks that old indexed in my node.
block_height = 277316
block_hash = rpc_connection.getblockhash(block_height)
decoded_tx = rpc_connection.getrawtransaction(txid, True, block_hash)
for output in decoded_tx['vout']:
    print(f"{output['value']} BTC to {output['scriptPubKey'].get('addresses', ['Unknown'])[0]}")

# Adding from example 3-5, modernized:
# We already have block_height and block_hash, but other than excluding that much of this is the same.
block = rpc_connection.getblock(block_hash)
transactions = block['tx']
block_value = 0
for txid in transactions:
    tx_val = 0
    decoded_tx = rpc_connection.getrawtransaction(txid, True, block_hash)
    for output in decoded_tx['vout']:
        tx_val += output['value']
    block_value += tx_val
print(f"Total value of block {block_height}: {block_value} BTC")