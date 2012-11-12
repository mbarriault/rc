function add --description "Add files to iTunes"
	for file in $argv
		osascript -e "tell application \"iTunes\" to add POSIX file \"$file\""
	end
end
