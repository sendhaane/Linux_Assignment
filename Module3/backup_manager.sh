#1. comman-line arguments and quoting
SOURCE_DIR="$1"
BACKUP_DIR="$2"
EXTENSION="$3"

if [ $# -ne 3 ]; then 
	echo "Usage: $0 \"<source_dir>\" \"<backup_dir>\" \"<file_extension>\""
	exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
	echo "ERROR: Source directory does not exist."
	exit 1
fi

#5. Conditional execution - create backup dir if not exited

if [ ! -d "$BACKUP_DIR" ]; then 
	mkdir -p "$BACKUP_DIR"
	if [ $? -ne 0 ]; then 
		echo "ERROR: Failed to create backup directory."
		exit 1
	fi
fi

#2. Globbing -finding files with given extention

FILES=("$SOURCE_DIR"/*"$EXTENTION")

if [ ! -e "${FILES[0]}" ]; then 
	echo "NO files with extension $EXTENTION found in source directory"
	exit 0
fi

#3. Export environment variable

export BACKUP_COUNT=0
TOTAL_SIZE=0

echo "Files to be backed up:"
echo "-----------------------"

for file in "${FILES[@]}";do
	if [ -f "$file" ]; then 
		size=$(stat -c %s "$file")
		echo "$(basename "$file") - ${size} bytes"
	fi
done


for file in "${FILES[@]}"; do
	if [ -f "$file" ]; then 
		filename=$(basename "$file")
		dest_file="$BACKUP_DIR/$filename"
		
		if [ -f "$dest_file" ]; then 
			if [ "$file" -nt "$dest_file" ]; then 
				cp "$file" "$dest_file"
				BACKUP_COUNT=$((BACKUP_COUNT+1))
				TOTAL_SIZE=$((TOTAL_SIZE + $(stat -c %s "$file")))
			fi
		else
			cp "$file" "$dest_file"
                	BACKUP_COUNT=$((BACKUP_COUNT+1))
                	TOTAL_SIZE=$((TOTAL_SIZE + $(stat -c %s "$file")))
		fi
	fi
done


#6. Output report
REPORT_FILE="$BACKUP_DIR/backup_report.log"

{
	echo "Backup summary report"
	echo "Source Directory : $SOURCE_DIR"
	echo "Backup Directory : $BACKUP_DIR"
	echo "File Extention : $EXTENTION"
	echo "Total Backup Count : $BACKUP_COUNT"
	echo "Total Size of the file : $TOTAL_SIZE"
	echo "Backup Completed on : $(date)"

}> "$REPORT_FILE"

echo "Report saved at: $REPORT_FILE"
	 


