from bitcoinlib.keys import Key

# Use the same private key (but this needs to be a 32-byte hex string, not a compressed pubkey!)
privkey_hex = "38109007313a5807b2eccc082c8c3fbb988a973cacf1a7df9ce725c31b14776"
key = Key(import_key=privkey_hex, network='bitcoin')

print("Public key:", key.public_hex)
print("Address:", key.address)
