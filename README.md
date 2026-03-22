# nixos-config

## how to use

Run command

```bash
git clone https://github.com/naruko-hstk/nixos-config /etc/nixos
```

And move your `hardware-configuration.nix` to `/etc/nixos/hosts/<your-host-name>/nix/`

```bash
mv /etc/nixos/hardware-configuration.nix /etc/nixos/hosts/<your-host-name>/nix/hardware-configuration.nix
```

Then run install command

```bash
cd /<your-root-mount>
sudo nixos-install --no-root-passwd # if using root can run nixos-install without sudo, and i recommended set atleast one user with wheel, it can keep your nixos safe without root account access.
```

