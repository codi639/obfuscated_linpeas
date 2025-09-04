# encode_linpeas.py
import base64
import random
import string
import sys

def xor(data, key):
    return bytes([b ^ key[i % len(key)] for i, b in enumerate(data)])

def main():
    if len(sys.argv) != 2:
        print("Usage: python encode_linpeas.py linpeas.sh > output.txt")
        return

    key = ''.join(random.choices(string.ascii_letters + string.digits, k=8)).encode()
    with open(sys.argv[1], 'rb') as f:
        original = f.read()

    encoded = xor(original, key)
    b64 = base64.b64encode(encoded).decode()

    print(f"# Key: {key.decode()}")
    print(b64)

if __name__ == "__main__":
    main()
