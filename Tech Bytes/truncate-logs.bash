#!/bin/bash

# adjust as needed
LOG_LIMIT= <insert here> 

# Provide at least 1 arg 
if [ "$#" -eq 0 ]; then
echo "Usage: $0 logfile1, logfile2, logfile3 ...."
exit 1
fi

# Function to truncate log files
truncate_logs() {
for logfile in "$@"; do
	# Check if logfile exists
	if [ -f "$logfile" ]; then
		# check log limit
		#log_size=$(stat -c%s "$logfile")
		log_size=$(du -h "$logfile")
		
		#  check logfile exceeded
		if ["$log_size" -gt "$LOG_LIMIT"]; then
			# Truncate logfile 
			> "$logfile"
			echo "Truncated $logfile"
		else
			echo "Truncation not needed: $logfile"
		fi
	else
		echo "File not found: $logfile"
	fi
done
}

# function call
truncate_logs "$@"

exit 0