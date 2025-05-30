import ecdsa
import os
from ecdsa.util import string_to_number, number_to_string

_p = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F
_r = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141
_b = 0x0000000000000000000000000000000000000000000000000000000000000007
_a = 0x0000000000000000000000000000000000000000000000000000000000000000
_Gx = 0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798
_Gy = 0x483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08ffb10d4b8
curve_secp256k1 = ecdsa.ellipticcurve.CurveFp(_p, _a, _b)
generator_secp256k1 = ecdsa.ellipticcurve.Point(curve_secp256k1, _Gx, _Gy, _r)
oid_secp256k1 = (1, 3, 132, 0, 10)
SECP256k1 = ecdsa.curves.Curve("SECP256k1", curve_secp256k1, generator_secp256k1,
oid_secp256k1)
ec_order = _r
curve = curve_secp256k1
generator = generator_secp256k1
def random_secret():
    return int.from_bytes(os.urandom(32), byteorder='big')

def get_point_pubkey(point):
    if point.y() & 1:
        prefix = '03'
    else:
        prefix = '02'
    key_hex = prefix + f'{point.x():064x}'
    return bytes.fromhex(key_hex)

def get_point_pubkey_uncompressed(point):
    key_hex = '04' + f'{point.x():064x}' + f'{point.y():064x}'
    return bytes.fromhex(key_hex)

secret = random_secret()
print("Secret: ", secret)

point = secret * generator
print( "EC point:", point)

compressed_pubkey = get_point_pubkey(point)
print("BTC compressed public key (hex):", compressed_pubkey.hex())

uncompressed_pubkey = get_point_pubkey_uncompressed(point)
print("BTC uncompressed public key (hex):", uncompressed_pubkey.hex())

point1 = ecdsa.ellipticcurve.Point(curve, point.x(), point.y(), ec_order)
assert point1 == point