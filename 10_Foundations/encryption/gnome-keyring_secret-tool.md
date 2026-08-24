
```bash
secret-tool store --label='Context7 API Token' service context7
# you will be prompted to provide secret

# retrieve secret
secret-tool lookup service context7

# inspect the stored item's metadata
secret-tool search service context7

# delete secret
secret-tool clear service context7

# listing all secrets is not available in secret-tool, you need some app like `seahorse` for that
```

```bash
sudo apt install gnome-keyring libsecret-tools
# check if secret service is running
pgrep -a gnome-keyring
```