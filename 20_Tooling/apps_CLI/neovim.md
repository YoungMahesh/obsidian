Reference: https://vonheikemen.github.io/learn-nvim/101/installation.html


## configuration

You can have multiple neovim configurations:
`~/.config/nvim` - main/minimal configuration
`~/.config/nvim-typescript` - configuration with typescript support

Create aliases to run neovim various configurations
```bash
alias vi='nvim'
alias vit='NVIM_APPNAME=nvim-typescript nvim'

# We can verify the location of the new config as follows:
vi --headless -c 'echo stdpath("config") . "\n"' -c 'quit'
vit --headless -c 'echo stdpath("config") . "\n"' -c 'quit'
```

## installation
```bash
# download
curl -L -o /tmp/nvim.tar.gz "https://github.com/neovim/neovim/releases/download/v0.12.3/nvim-linux-x86_64.tar.gz"
# extract
tar -xzf /tmp/nvim.tar.gz -C /tmp/nvim
# specify location
sudo mv /tmp/nvim/nvim-linux-x86_64 /opt/neovim
# create symlink
sudo ln -s /opt/neovim/bin/nvim /usr/local/bin/nvim
```

