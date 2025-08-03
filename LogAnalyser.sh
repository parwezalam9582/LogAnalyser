#!/bin/bash

# Exit on error
set -e

# Check if directory argument is passed
if [ -z "$1" ]; then
  echo "Usage: $0 <log-directory>"
    exit 1
    fi
#
    LOG_DIR="$1"
#
#    # Check if directory exists
    if [ ! -d "$LOG_DIR" ]; then
      echo "Error: Directory $LOG_DIR does not exist."
        exit 1
        fi
#
#        # Create Archive Directory
        ARCHIVE_DIR="/var/log-archive"
        mkdir -p "$ARCHIVE_DIR"

#        # Date-Time format for archive name
        TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
        ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
        ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"

#        # Compress the logs
        tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .
#
#        # Log the archive details
        echo "$(date +"%Y-%m-%d %H:%M:%S") - Archived $LOG_DIR to $ARCHIVE_PATH" >> "${ARCHIVE_DIR}/archive.log"
#
        echo "Logs archived successfully to $ARCHIVE_PATH"
        
