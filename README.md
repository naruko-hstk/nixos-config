# nixos-config

## how to use

Run command

```bash
git clone https://github.com/naruko-hstk/nixos-config /mnt/etc/nixos
```

And move your `hardware-configuration.nix` to `/mnt/etc/nixos/hosts/<your-host-name>/`

```bash
mv /etc/nixos/hardware-configuration.nix /mnt/etc/nixos/hosts/<your-host-name>/hardware-configuration.nix
```

Then run install command

```bash
cd /<your-root-mount>
sudo nixos-install --no-root-passwd # if using root can run nixos-install without sudo, and i recommended set atleast one user with wheel, it can keep your nixos safe without root account access.
```

## for lazy guys

```bash
sudo -i
cgdisk /dev/sdX # or /dev/nvmeXnY
# EFI/BOOT => +512M (/dev/sdX1 /dev/nvmeXnYp1)
# ROOT => -8G/+32G (/dev/sdX2 /dev/nvmeXnYp2)
# HOME => 0/-8G (/dev/sdX3 or /dev/nvmeXnYp3)
# swap => MAX (/dev/sdX3or4 or /dev/nvmeXnYp3or4)
mkfs.fat -F 32 /dev/sdX1 # or /dev/nvmeXnYp1
mkfs.btrfs /dev/sdX2 # or /dev/nvmeXnYp2
mkfs.btrfs /dev/sdX3 # or /dev/nvmeXnYp3
mkswap /dev/sdX3or4 # or /dev/nvmeXnYp3or4
mount /dev/sdX2 /mnt # or /dev/nvmeXnYp2
btrfs sub create /mnt/@
btrfs sub create /mnt/@home # do if no home volume on your disk
btrfs sub create /mnt/@nix
btrfs sub create /mnt/@snapshots
umount /mnt
mount /dev/sdX3 /mnt # do if home volume on your disk
btrfs sub create /mnt/@home # do if home volume on your disk
umount /mnt # do if home volume on your disk
mount -o subvol=@,compress=zstd,noatime,space_cache=v2,discard=async /dev/sdX2 /mnt # or /dev/nvmeXnYp2
mkdir -p /mnt/{boot/efi,home,nix,.snapshots} # if legacy bios use boot instead boot/efi
mount -o subvol=@home,compress=zstd,noatime,space_cache=v2,discard=async /dev/sdX2 /mnt/home # or /dev/nvmeXnYp2, if have home volume on your disk /dev/sdX3 or /dev/nvmeXnYp3
mount -o subvol=@nix,compress=zstd,noatime,space_cache=v2,discard=async /dev/sdX2 /mnt/nix # or /dev/nvmeXnYp2
mount -o subvol=@snapshots,compress=zstd,noatime,space_cache=v2,discard=async /dev/sdX2 /mnt/.snapshots # or /dev/nvmeXnYp2
swapon /dev/sdX3 # or /dev/nvmeXnYp3, if have home volume on your disk /dev/sdX4 or /dev/nvmeXnYp4
mount -o uid=0,gid=0,fmask=0177,dmask=0077,noatime,noexec,nodev,nosuid,errors=remount-ro,space_cache=v2,discard=async /dev/sdX1 /mnt/boot/efi # or /dev/nvmeXnYp1, if legacy bios use /mnt/boot instead /mnt/boot/efi
nixos-generate-config --root /mnt
mv /mnt/etc/nixos /mnt/etc/nixos-bak
git clone https://github.com/naruko-hstk/nixos-config /mnt/etc/nixos
mv /mnt/etc/nixos-bak/hardware-configuration.nix /mnt/etc/nixos/hosts/<hostname>/
git add -f /mnt/etc/nixos/hosts/<hostname>/hardware-configuration.nix # if issue#15544 in NixOS/nix(https://github.com/NixOS/nix/issues/15544) complete can skip it.
nixos-install --no-root-passwd --flake /mnt/etc/nixos#<your.host.fqdn>
reboot
```
