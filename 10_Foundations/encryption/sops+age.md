Create age key-pair:

```bash
age-keygen -o age-key.txt
mkdir -p ~/.config/sops/age
cp age-key.txt ~/.config/sops/age/keys.txt
chmod 600 ~/.config/sops/age/keys.txt
```

Setup SOPS for project.
Inside project create .sops.toml with content:

```yaml
creation_rules:
  - path_regex: secrets/.*\.(json|yaml|yml|env|toml)$
    age: <age-public-key>
```

Encrypt file: `sops encrypt --in-place secrets/credentials.json`

Decrypt file: `sops decrypt secrets/credentials.json.enc > credentials.json`

### Installation

```bash
apt install age

# install sops
curl -fsSL https://github.com/getsops/sops/releases/download/v3.13.3/sops-v3.13.3.linux.amd64 -o /usr/local/bin/sops
chmod +x /usr/local/bin/sops
```
