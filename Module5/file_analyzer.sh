#!/bin/bash

ERROR_LOG="error.log"

#errorlog
log_error(){
	echo "[$(date)] ERROR: $1" | tee -a "$ERROR_LOG" >&2
}


#help_command
show_help() {
	 cat <<EOF
Usage: $0 [OPTIONS]

Options:
  -d <directory>   Directory to search recursively
  -k <keyword>     Keyword to search
  -f <file>        Search directly inside a file
  --help           Display this help menu

Examples:
  $0 -d sample1 -k error
  $0 -f file3.txt -k error
  $0 --help
EOF
}
shopt -s nullglob


#recursive
search_recursive() {
	local dir="$1"
	local keyword="$2"

	for item in "$dir"/*; do
		if [ -d "$item" ]; then 
			search_recursive "$item" "$keyword"

		elif [ -f "$item" ]; then 
			if grep -q "$keyword" "$item"; then 
				echo "Match found in: $item"
			fi
		fi
	done 
}


if [[ "$@" == *"--help"* ]]; then
	show_help
	exit 0
fi




while getopts ":d:f:k:" opt; do
	case $opt in
		d) DIRECTORY="$OPTARG" ;;
		f) FILE="$OPTARG" ;;
		k) KEYWORD="$OPTARG" ;;
		\?) log_error "Invalid option: -$OPTARG"
			exit 1 ;;
	esac
done


if [[ -z "$KEYWORD" || ! "$KEYWORD" =~ ^[A-Za-z0-9_]+$ ]]; then
	log_error "Invalid or empty keyword."
	exit 1
fi


if [[ $# -eq 0 ]]; then
	log_error "No arguments provided. Use --help for usage."
	exit 1
fi


if [ -n "$FILE" ]; then 
	if [ ! -f "$FILE" ]; then
		log_error "File '$FILE' does not exit."
		exit 1
	fi

	echo "Searching in file: $FILE"


	while read -r line; do
		grep -q "$KEYWORD" <<<"$line" && echo "Match: $line"
	done < "$FILE"

	exit 0

fi


if [ -n "$DIRECTORY" ]; then 
	if [ ! -d "$DIRECTORY" ]; then
		log_error "DIRECTORY $DIRECTORY does not exist."
		exit 1
	fi

	echo "Searching directory: $DIRECTORY"
	search_recursive "$DIRECTORY" "$KEYWORD"

fi


echo "Successfully"
exit 0
