#!/bin/bash
BACKUP_DIR="$HOME/mcbackups"
WORLD_DIR="$HOME/mine-server/world"
TIMESTAMP=$(date +%F_%H-%M)

tar -czf "$BACKUP_DIR/world-$TIMESTAMP.tar.gz" -C "$WORLD_DIR" .

rclone copy "$BACKUP_DIR/world-$TIMESTAMP.tar.gz" gdrive:/minecraft-backup -P

find "$BACKUP_DIR" -type f -mtime +7 -delete

echo "🟢 Backup has been complete successfully: $BACKUP_DIR/world-$TIMESTAMP.tar.gz"
