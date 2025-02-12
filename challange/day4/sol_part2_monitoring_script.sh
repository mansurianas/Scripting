#!/bin/bash

# Function to display system metrics
display_metrics() {
    echo "=== System Metrics ==="
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU Usage: " 100 - $1 "%"}'
    echo "Memory Usage:"
    free -h | awk '/^Mem:/ {print "Memory Usage: " $3 "/" $2}'
    echo "Disk Usage:"
    df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
    echo "======================"
}

# Function to monitor a specific service
monitor_service() {
    read -p "Enter the service name to monitor (e.g., nginx): " service
    if systemctl is-active --quiet "$service"; then
        echo "$service is running."
    else
        echo "$service is not running."
        read -p "Do you want to start $service? (y/n): " choice
        if [[ "$choice" == "y" ]]; then
            sudo systemctl start "$service"
            echo "$service has been started."
        else
            echo "$service remains stopped."
        fi
    fi
}

# Main loop for user interaction
while true; do
    echo "=== Monitoring Script Menu ==="
    echo "1. View System Metrics"
    echo "2. Monitor a Service"
    echo "3. Exit"
    read -p "Choose an option: " option

    case $option in
        1)
            display_metrics
            ;;
        2)
            monitor_service
            ;;
        3)
            echo "Exiting the script."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac

    # Sleep interval
    read -p "Enter sleep interval in seconds (default is 5): " interval
    interval=${interval:-5}
    sleep "$interval"
done
