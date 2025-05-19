#!/bin/bash

read -p "Enter the path to the log directory: " log_dir

if [[ -d "$log_dir" ]]; then
	log_files=$(find "log_dir" -type f -name "*.log")
	
	if [[ -n "$log_files" ]]; then
		echo "Directory exists and contains .log files."
	else 
		echo "Directory exists, but no .log files found."
	fi
else
	echo "Directory not found."
fi
