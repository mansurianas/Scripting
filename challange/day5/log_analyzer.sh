#!/bin/bash

# Check if a log file path is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <log_file_path>"
    exit 1
fi

log_file="$1"

# Count error messages
error_count=$(grep -c -E "ERROR|Failed" "$log_file")
echo "Total error count: $error_count"

# Find critical events
echo "Critical events:"
grep -n "CRITICAL" "$log_file"

# Top 5 error messages
echo "Top 5 error messages:"
grep -E "ERROR|Failed" "$log_file" | awk '{print $0}' | sort | uniq -c | sort -nr | head -n 5

# Generate summary report
report_file="summary_report_$(date +%Y%m%d).txt"
{
    echo "Date of analysis: $(date)"
    echo "Log file name: $log_file"
    echo "Total lines processed: $(wc -l < "$log_file")"
    echo "Total error count: $error_count"
    echo "Top 5 error messages:"
    grep -E "ERROR|Failed" "$log_file" | awk '{print $0}' | sort | uniq -c | sort -nr | head -n 5
    echo "Critical events:"
    grep -n "CRITICAL" "$log_file"
} > "$report_file"

echo "Summary report generated: $report_file"

# Move processed log file
archive_dir="archived_logs"
mkdir -p "$archive_dir"
mv "$log_file" "$archive_dir/"
echo "Log file moved to $archive_dir/"
