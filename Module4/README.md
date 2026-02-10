# Module 4 – Operators and Conditions in Shell Scripting

## Assignment Title
Parsing Input File and Extracting Specific Parameters Using Bash Script

---

## Objective
The objective of this assignment is to write a Bash shell script that reads an input
file line by line, applies conditional checks to identify specific parameters, and
generates a structured output file containing only the required fields.

---

## Input Parameters to be Extracted
The script extracts the following parameters from the input file:

- `frame.time`
- `wlan.fc.type`
- `wlan.fc.subtype`

---

## Input File
- File name: `input.txt`
- The file contains structured text data with multiple parameters per record.

---

## Output File
- File name: `output.txt`
- Contains grouped listings of:
  - frame time
  - WLAN frame control type
  - WLAN frame control subtype

### Sample Output Format
```text
"frame.time": "Nov 14, 2024 11:44:48.219200000 India Standard Time",
"wlan.fc.type": "1",
"wlan.fc.subtype": "9"

"frame.time": "Nov 14, 2024 11:44:48.219208000 India Standard Time",
"wlan.fc.type": "0",
"wlan.fc.subtype": "1"
