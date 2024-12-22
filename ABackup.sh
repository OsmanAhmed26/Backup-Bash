#!/bin/bash

# Prompt the user for the source and destination directories
echo "Enter the source directory:"
read SOURCE_DIR

echo "Enter the destination (backup) directory:"
read BACKUP_DIR

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist. Exiting..."
    exit 1
fi

# Check if the destination directory exists
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Error: Destination directory '$BACKUP_DIR' does not exist. Exiting..."
    exit 1
fi

# Timestamp for the backup file
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE=$BACKUP_DIR/backup_$TIMESTAMP.tar.gz
LOG_FILE=$BACKUP_DIR/backup.log

# Create the compressed backup
echo "Creating backup..."
tar -czf $BACKUP_FILE -C "$SOURCE_DIR" . 2>>$LOG_FILE

# Check if the backup succeeded
if [ $? -eq 0 ]; then
    echo "$(date): Backup successful: $BACKUP_FILE" | tee -a $LOG_FILE
else
    echo "$(date): Backup failed." | tee -a $LOG_FILE
    exit 1
fi

