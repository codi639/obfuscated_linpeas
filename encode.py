# encode.py
import base64
import random
import string
import sys

def xor(data, key):
    return bytes([b ^ key[i % len(key)] for i, b in enumerate(data)])

def generate_key(length=8):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length)).encode()

def main():
    if len(sys.argv) != 2:
        print("Usage: python encode.py <input_file> > encoded.txt")
        return

    key = generate_key()
    with open(sys.argv[1], 'rb') as f:
        original = f.read()

    encoded = xor(original, key)
    b64 = base64.b64encode(encoded).decode()

    print(f"# Key: {key.decode()}")
    print(b64)

if __name__ == "__main__":
    main()
