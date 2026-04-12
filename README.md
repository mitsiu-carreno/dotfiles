# Quick setup
1. Install nix and nix-darwin
2. Download the code
```bash
nix-shell -p git —run ‘git clone https://github.com/mitsiu-carreno/dotfiles.git /etc/nix-darwin’
```

3. Build the flake
```bash
sudo nix run nix-darwin/master#darwin-rebuild --extra-experimental-features "nix-command flakes"  -- switch  --flake /etc/nix-darwin#mac
```

4. Populate .config/sops/age/keys.txt

5. Rebuild the flake with secrets 
```bash
sudo darwin-rebuild switch --flake /etc/nix-darwin#mac
```

# Update pkgs
```bash
nix flake update
```

# Search pkgs
```bash
nix search nixpkgs kitty
```

Or browse
[search.nixos.org](https://search.nixos.org)

# Documentation
```bash
darwin-help
man 5 configuration.nix
```

# Code formatting
```bash
nix-shell -p alejandra
alejandra .
```

# Sops
```bash
nix-shell -p sops age 
```
## Key generation
```bash
age-keygen -o ~/.config/sops/age/keys.txt

export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
sops secrets/secrets.yaml
```

# Historical Archive
1. Install nix
```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
```

2. Install nix-darwin
### Creating flake.nix
```bash
sudo mkdir -p /etc/nix-darwin
sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
cd /etc/nix-darwin

nix flake init -t nix-darwin/master --extra-experimental-features "nix-command flakes"
sed -i '' "s/simple/mac/" flake.nix
```

### Installing nix-darwin
```bash
sudo nix run nix-darwin/master#darwin-rebuild --extra-experimental-features "nix-command flakes"  -- switch  --flake /etc/nix-darwin#mac
```

3. Home-manager as nix-darwin module
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```
