# Module 3 – Automating File Backup and Reporting

## Assignment Title
Automating File Backup and Reporting using Shell Scripting

---

## Objective
The objective of this assignment is to design and implement a shell script that automates
the process of backing up files from a source directory to a backup directory based on a
specific file extension. The script also generates a summary report after execution.

---

## Script Name
`backup_manager.sh`

---

## Concepts Used
This assignment demonstrates the following Linux and shell scripting concepts:

- Command-line arguments and quoting
- Globbing (wildcards)
- Environment variables using `export`
- Array operations
- Conditional execution (`if`, `else`)
- File timestamp comparison
- Input/output redirection
- Report generation

---

## Script Usage

```bash
./backup_manager.sh "<source_directory>" "<backup_directory>" "<file_extension>"
