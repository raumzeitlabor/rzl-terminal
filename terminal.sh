#!/usr/bin/env bash


kill $(pgrep -f "bash $0" | grep -v "$$")

if ! shopt -q login_shell; then
	export TERM=wyse50
	export LC_ALL=en_US.ISO-8859-1
	export LANG="$LC_ALL"
#	stty rows 24 cols 136
	stty rows 34 cols 130
fi

while true; do
	clear
	cat "/var/local/rzl-logo.txt"

	echo "Willkommen beim oeffentlichen IRC-Terminal des RaumZeitLabors."
	echo "Wenn du fertig bist, bitte ^A ^D druecken (erst Ctrl-A, danach Ctrl-D)"
	echo
	echo "Druecke jetzt Enter, um in den IRC-Client zu kommen."
	echo -n "Druecke jetzt s, um in eine Shell zu gelangen."

	# -s: Do not print character
	# -t: Time out after 10 seconds (to redraw if serial terminal was just powered on)
	read -st 10 -n 1 key;

	# Return value of read will be 0 if a user entered something, and != 0 if timeout
	if [ $? != 0 ]; then
		continue
	fi

	if [[ "$key" == "" ]]; then
		# Attach if it exists, otherwise create a new screen
		screen -DRS irc "$(which irssi)"
	elif [[ "$key" == "s" ]]; then
		echo -e "\n\nBitte warten..."

		cd
		zsh
	fi;
done;

