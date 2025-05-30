import os
import hashlib
import base58
import ecdsa

# This script generates a Bitcoin vanity address that starts with "1kid"
TARGET_PREFIX = "1kid"

def generate_private_key():
    return os.urandom(32)

def private_key_to_public_key(privkey_bytes):
    sk = ecdsa.SigningKey.from_string(privkey_bytes, curve=ecdsa.SECP256k1)
    vk = sk.verifying_key
    x = vk.pubkey.point.x()
    y = vk.pubkey.point.y()
    prefix = b'\x03' if y & 1 else b'\x02'
    return prefix + x.to_bytes(32, 'big')

def public_key_to_p2pkh_address(pubkey_bytes):
    sha256 = hashlib.sha256(pubkey_bytes).digest()
    ripemd160 = hashlib.new('ripemd160', sha256).digest()
    versioned_payload = b'\x00' + ripemd160
    checksum = hashlib.sha256(hashlib.sha256(versioned_payload).digest()).digest()[:4]
    address_bytes = versioned_payload + checksum
    return base58.b58encode(address_bytes).decode()

def matches_prefix(address, prefix):
    return address.lower().startswith(prefix.lower())

attempts = 0
while True:
    attempts += 1
    privkey = generate_private_key()
    pubkey = private_key_to_public_key(privkey)
    address = public_key_to_p2pkh_address(pubkey)

    if matches_prefix(address, TARGET_PREFIX):
        print(f"Found vanity address after {attempts} attempts!")
        print("Address:", address)
        print("Private key (hex):", privkey.hex())
        break
