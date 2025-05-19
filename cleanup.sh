#!/bin/bash

# Get log directory from the user
read -p "Enter the path to the log directory: " log_dir

# Check if the entered directory exists
if [[ -d "$log_dir" ]]; then

    # Find .log files in the directory
    log_files=$(find "$log_dir" -mtime +7 -type f -name "*.log")

    # Check if any .log files were found
    if [[ -n "$log_files" ]]; then

        echo "$log_files"

        # Get confirmation from the user to delete the files
        read -p "Do you want to delete the found log files? (y/n) " confirm

        if [[ "$confirm" == "y" ]]; then
    	    archive_file="$log_dir/archive/logs-$(date +%Y%m%d).tar.gz"	
	    mkdir -p "$log_dir/archive"
            tar -czf "$archive_file" $log_files
            echo "Files archived to: $archive_file"

	    for file in $log_files; do
		rm -i "$file"
	    done
	    echo "Selected log files deleted."	

	elif [[ "$confirm" == "n" ]]; then
            echo "Process was canceled."
        else
            echo "Invalid input. Please enter 'y' or 'n'."
        fi

    else
        echo "Directory exists, but no .log files found."
    fi

else
    echo "Directory not found."
fi

