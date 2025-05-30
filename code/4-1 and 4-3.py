from binascii import hexlify, unhexlify
import hashlib
import base58
from bitcoin.wallet import CBitcoinSecret 

# This is a simple modular arithmetic check for a point on the secp256k1 curve
#4-1
p = 115792089237316195423570985008687907853269984665640564039457584007908834671663
x = 55066263022277343669578718895168534326250603453777594175500187360389116729240
y = 32670510020758816978083085130507043184471273380659243275938904335757337482424
print((x ** 3 + 7 - y**2) % p)

# Example 4-3 converted to Python
decoded = unhexlify("038109007313a5807b2eccc082c8c3fbb988a973cacf1a7df9ce725c31b14776")
decoded = decoded[:32]
secret = CBitcoinSecret.from_secret_bytes(decoded)
public_key = secret.pub
print("Public Key: ", hexlify(public_key))
public_key_data = public_key
sha256 = hashlib.sha256(public_key_data).digest()
hash = hashlib.new('ripemd160', sha256).digest()
unencoded_address = bytearray()
unencoded_address.append(0x00)
unencoded_address += hash
checksum = hashlib.sha256(hashlib.sha256(unencoded_address).digest()).digest()[:4]
unencoded_address += checksum
assert len(unencoded_address) == 25
address = base58.b58encode(unencoded_address).decode()
print("Address: ", address)
