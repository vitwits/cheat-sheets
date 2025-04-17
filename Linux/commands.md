# 🗂️ Linux File System Management – Detailed Command Wiki

---

## 🔍 1. Navigation & Listing

### `pwd` – Print Working Directory
Shows the full path of the current directory.
```bash
pwd
```

### `ls` – List Directory Contents
Lists files and directories.
```bash
ls                # basic list
ls -l             # long listing format
ls -a             # include hidden files (starting with .)
ls -lh            # human-readable sizes
ls -lt            # sort by modification time
ls -R             # recursive listing
```

### `cd` – Change Directory
Navigate the file system.
```bash
cd /etc
cd ..             # up one level
cd ~              # go to home directory
cd -              # switch to previous directory
```

---

## 📄 2. File Creation, Deletion & Manipulation

### `touch` – Create an Empty File
```bash
touch file.txt
```

### `cp` – Copy Files
```bash
cp file1.txt file2.txt                    # copy single file
cp -r dir1/ dir2/                         # recursive copy for directories
cp -u file.txt /backup/                  # copy only if source is newer
cp -i file1.txt file2.txt                 # prompt before overwrite
```

### `mv` – Move or Rename Files
```bash
mv oldname.txt newname.txt               # rename
mv file.txt /target/folder/              # move to another location
```

### `rm` – Remove Files
```bash
rm file.txt                              # delete file
rm -i file.txt                           # prompt before deletion
rm -f file.txt                           # force deletion
rm -r folder/                            # recursive delete
```

---

## 📁 3. Directory Creation, Deletion & Manipulation

### `mkdir` – Create Directory
```bash
mkdir new_folder
mkdir -p parent/child/grandchild         # create nested directories
```

### `rmdir` – Remove Empty Directory
```bash
rmdir empty_folder
```

### `rm -r` – Remove Directory and Contents
```bash
rm -r folder_name
```

### `cp -r` – Copy Directory
```bash
cp -r dir1/ dir2/
```

### `mv` – Move or Rename Directory
```bash
mv folder1/ new_folder_name/
```

---

## 📜 4. File Content Viewing

### `cat` – View File Content
```bash
cat file.txt
```

### `less` – Scrollable Viewer (recommended for large files)
```bash
less file.txt
```

### `more` – Basic Viewer (less functional than `less`)
```bash
more file.txt
```

### `head` – First Lines of File
```bash
head -n 20 file.txt                      # show first 20 lines
```

### `tail` – Last Lines of File
```bash
tail -n 20 file.txt                      # show last 20 lines
tail -f file.log                         # follow file (useful for logs)
```

---

## 📝 5. File Editing

### `nano` – Simple Text Editor
```bash
nano file.txt
```

### `vim` or `vi` – Advanced Text Editor
```bash
vim file.txt
```

### `gedit` – GUI Editor (GNOME-based systems)
```bash
gedit file.txt &
```

---

## 🔎 6. File & Directory Searching

### `find` – Locate Files and Directories
```bash
find / -name "*.conf"                    # search by name
find . -type d -name "*backup*"          # search for directories
find /var -mtime -1                      # modified in last 1 day
find . -size +100M                       # files larger than 100MB
```

### `locate` – Fast Search Using Database
```bash
locate bashrc                            # returns full paths
```

### `updatedb` – Update `locate` Database
```bash
sudo updatedb
```

### `which` – Show Path of Executable
```bash
which python
```

### `whereis` – Locate Binary, Source, and Manual
```bash
whereis gcc
```

---

## 🔐 7. Permissions & Ownership

### `chmod` – Change File Permissions
```bash
chmod 755 script.sh                      # rwxr-xr-x
chmod u+x script.sh                      # add execute for user
```

### `chown` – Change File Owner
```bash
chown user file.txt
chown user:group file.txt
```

### `ls -l` – View Permissions
```bash
ls -l                                    # shows -rw-r--r-- and ownership
```

---

## 🔗 8. Links

### `ln` – Create Hard Link
```bash
ln original.txt hardlink.txt
```

### `ln -s` – Create Symbolic Link
```bash
ln -s /path/to/file symlink
```

### `readlink` – Show Target of Symbolic Link
```bash
readlink symlink
```

---

## 🗜️ 9. Archiving & Compression

### `tar` – Archive Files
```bash
tar -cvf archive.tar folder/            # create archive
tar -xvf archive.tar                    # extract
tar -czvf archive.tar.gz folder/       # compress using gzip
tar -xvzf archive.tar.gz               # extract gzip
```

### `gzip` / `gunzip` – Compress and Decompress
```bash
gzip file.txt                           # creates file.txt.gz
gunzip file.txt.gz
```

### `zip` / `unzip` – Zip Format
```bash
zip archive.zip file1 file2
unzip archive.zip
```

---

## 💽 10. Disk & Partition Management

### `df` – Disk Free
```bash
df -h                                   # human-readable format
```

### `du` – Disk Usage
```bash
du -sh folder/                         # summarize total size
du -ah . | sort -rh | head             # find largest files
```

### `lsblk` – List Block Devices
```bash
lsblk                                   # tree view of devices and partitions
```

### `fdisk` – Partition Tool
```bash
sudo fdisk /dev/sdX                     # interactive
```

### `parted` – Alternative Partition Tool
```bash
sudo parted /dev/sdX
```

---

## 🔗 11. Mounting & Unmounting

### `mount` – Mount File System
```bash
sudo mount /dev/sdX1 /mnt
```

### `umount` – Unmount File System
```bash
sudo umount /mnt
```

### `cat /etc/fstab` – Persistent Mounts
View auto-mount settings:
```bash
cat /etc/fstab
```

### `mount -a` – Mount All from fstab
```bash
sudo mount -a
```

---

> 📌 *This document is meant as a comprehensive reference for managing the Linux file system using command-line tools. It's suitable for beginners and intermediate users preparing for certifications like CKA.*

