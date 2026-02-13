# File Analyzer Script

## 📌 Overview

`file_analyzer.sh` is a Bash script that demonstrates advanced shell scripting concepts including:

- Recursive functions
- Redirection and error handling
- Here documents and here strings
- Special parameters
- Regular expressions
- Command-line argument parsing using `getopts`

The script searches for a keyword inside:
- A single file (`-f`)
- A directory and its subdirectories recursively (`-d`)

---

## 🛠 Features

### 1️⃣ Recursive Directory Search
Uses a recursive function to traverse directories and search for files containing a specified keyword.

### 2️⃣ Error Logging
- Errors are logged to `error.log`
- Errors are displayed in the terminal
- Proper use of `stderr` redirection

### 3️⃣ Here Document
Displays a formatted help menu when `--help` is passed.

### 4️⃣ Here String
Used to search a keyword within a file line-by-line.

### 5️⃣ Special Parameters Used
- `$0` → Script name
- `$#` → Argument count
- `$@` → All arguments
- `$?` → Last command exit status

### 6️⃣ Regular Expressions
Validates that the keyword:
- Is not empty
- Contains only letters, numbers, or underscores

### 7️⃣ getopts
Handles command-line arguments:
- `-d <directory>`
- `-k <keyword>`
- `-f <file>`
- `--help`

---

## 🚀 Usage

### Display Help

```bash
./file_analyzer.sh --help
