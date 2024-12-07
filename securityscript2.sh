#!/bin/bash

#Variables

monitor_dir="/etc/"          # Directory to monitor
hash_file="/tmp/dir_hashes"  # File to store reference hashes

#Create reference file if it doesn't exist
[ -f "$hash_file" ] || find "$monitor_dir" -type f -exec sha256sum {} + | sort > "$hash_file"

#calculate current hashes
find "$monitor_dir" -type f -exec sha256sum {} + | sort > /tmp/current_hashes

# Compare and print changes
diff "$hash_file" /tmp/current_hashes || echo "Changes detected in $monitor_dir."

# Update reference file
mv /tmp/current_hashes "$hash_file"
