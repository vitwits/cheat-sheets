# 1. Creating a backup image of the SD card:

```sh
lsblk                # Identify the SD card device
sudo dd if=/dev/sdb of=~/raspberry_backup.img bs=4M status=progress   # Create the image

```

# 2. Restoring a backup image to the SD card:
```sh
lsblk                # Identify the SD card device
sudo dd if=~/raspberry_backup.img of=/dev/sdb bs=4M status=progress  # Restore the image to the SD card
sync                 # Finalize the write and sync the data
```