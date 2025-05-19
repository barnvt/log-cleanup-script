#!/bin/bash

# Get log directory from the user
read -p "Enter the path to the log directory: " log_dir

# Check if the entered directory exists
if [[ -d "$log_dir" ]]; then

    # Find .log files in the directory
    log_files=$(find "$log_dir" -type f -name "*.log")

    # Check if any .log files were found
    if [[ -n "$log_files" ]]; then

        echo "Directory exists and contains .log files."
        echo "$log_files"

        # Get confirmation from the user to delete the files
        read -p "Do you want to delete the found log files? (y/n) " confirm

        if [[ "$confirm" == "y" ]]; then
            rm -i $log_files
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

