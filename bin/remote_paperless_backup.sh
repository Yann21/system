#!/bin/bash

# Step 1: SSH into Hetzner and copy the originals to a local backup folder
echo "Copying files from Docker container on Hetzner to paperless_backup..."
ssh hetzner "docker container cp paperless-ng:/data/media/documents/originals/ paperless_backup"

# Step 2: SSH into Hetzner and create a tar.gz archive of the backup folder to compress it
echo "Compressing paperless_backup into a tar.gz archive..."
ssh hetzner "tar -czf paperless_backup.tar.gz paperless_backup"

# Step 3: Securely copy the tar.gz archive to your local machine
echo "Transferring the tar.gz archive to your local machine..."
scp hetzner:paperless_backup.tar.gz .

# Step 4: Unpack the tar.gz archive locally
echo "Unpacking the tar.gz archive locally..."
tar -xzf paperless_backup.tar.gz

# Step 5: SSH into Hetzner and remove the uncompressed folder and the tar.gz archive
echo "Cleaning up remote server: removing the uncompressed folder and tar.gz archive..."
ssh hetzner "rm -r paperless_backup paperless_backup.tar.gz"

# Step 6: Remove the tar.gz file locally (optional, if you don't need to keep the archive)
echo "Removing the local tar.gz archive..."
rm paperless_backup.tar.gz

# Step 7: Move the paperless_backup folder to ~/Documents/Backup with the current month and year
current_date=$(date +'%m_%Y')
echo "Moving paperless_backup to ~/Documents/Backup/paperless_$current_date..."
mv paperless_backup ~/Documents/Backup/paperless_$current_date

echo "Backup process completed successfully."

