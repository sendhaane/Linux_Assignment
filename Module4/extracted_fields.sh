#!/bin/bash


if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="output.txt"


> "$OUTPUT_FILE"

awk '
/"frame.time"/ {
    frame_time=$0
}
/"wlan.fc.type"/ {
    wlan_type=$0
}
/"wlan.fc.subtype"/ {
    wlan_subtype=$0

    # When all three are found, print them
    print frame_time >> "output.txt"
    print wlan_type >> "output.txt"
    print wlan_subtype >> "output.txt"
    print "" >> "output.txt"
}
' "$INPUT_FILE"
