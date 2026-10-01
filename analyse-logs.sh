#!/bin/bash

# 1. Path and variables
LOG_DIR="logs"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo "Analyzing logs in $LOG_DIR"

# 2. Find log files modified in the last 24 hours (safely handle spaces)
# Using mapfile/readarray to store files in an array properly
mapfile -t LOG_FILES < <(find "$LOG_DIR" -name "*.log")

# 3. Outer loop: go through each log file found
for LOG_FILE in "${LOG_FILES[@]}"; do
    echo "=================================================="
    echo "====================$LOG_FILE===================="
    echo "=================================================="
    
    # 4. Inner loop: go through each pattern
    for PATTERN in "${ERROR_PATTERNS[@]}"; do
        echo -e "\nsearching $PATTERN logs in $LOG_FILE file"
        grep "$PATTERN" "$LOG_FILE"
        
        echo -e "\nNumber of $PATTERN logs found in $LOG_FILE"
        grep -c "$PATTERN" "$LOG_FILE"
    done
done