#!/bin/bash

# Remote SSH details
HETZNER_USER="yann"
REMOTE_BACKUP_DIR="/home/$HETZNER_USER/paperless_backup"
TIMESTAMP=$(date +'%m_%Y')
REMOTE_ARCHIVE="$REMOTE_BACKUP_DIR/paperless_backup_$TIMESTAMP.tar.gz"
LOCAL_BACKUP_DIR="$HOME/Documents/Backup"

echo "Starting Paperless NG backup from Hetzner Kubernetes cluster..."

# Step 1: SSH into Hetzner and execute the backup commands
ssh hetzner << 'EOF'
    echo "Finding Paperless NG pod..."
    POD_NAME=$(microk8s kubectl get pod -n default -l app=paperless-ng --field-selector status.phase=Running -o jsonpath="{.items[0].metadata.name}")
    REMOTE_DIR="/data/media/documents/originals"
    BACKUP_DIR="/home/$USER/paperless_backup"

    echo "Copying files from Kubernetes pod to server..."
    mkdir -p "$BACKUP_DIR"
    microk8s kubectl cp "default/$POD_NAME:$REMOTE_DIR" "$BACKUP_DIR"

    echo "Compressing backup..."
    tar -czf "$BACKUP_DIR/paperless_backup_$(date +'%m_%Y').tar.gz" -C "$BACKUP_DIR" .

    echo "Cleanup temporary extracted backup..."
    rm -rf "$BACKUP_DIR/originals"

    echo "Backup complete on Hetzner."
EOF

# Step 2: Securely copy the tar.gz archive to local machine
echo "Transferring the backup archive from Hetzner to local machine..."
scp "hetzner:$REMOTE_ARCHIVE" "$LOCAL_BACKUP_DIR/"

# Step 3: SSH into Hetzner and clean up the remote backup
echo "Cleaning up backup files on Hetzner..."
ssh hetzner "rm -rf $REMOTE_BACKUP_DIR"

echo "Backup process completed successfully!"

