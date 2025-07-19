#!/bin/bash

# TexXpander
# Jasir Alavi
# Version : 1.3
# Released: 19 Jul 2025
# https://github.com/jasiralavi/TexXpander

# Adapted from Texpander by leehblue
# https://github.com/leehblue/texpander
# Version: 2.0 / Release: November 24, 2017


# Define base directory for TexXpander
texxpander_dir="${HOME}/Softwares/TexXpander"

# Get window id, pass to getwindow pid to output the pid of current window
pid=$(xdotool getwindowfocus getwindowpid)

# Store text name of process based on pid of current window
proc_name=$(cat "/proc/$pid/comm")

# Check if the active window is a terminal
if [[ $proc_name == "gnome-terminal" || $proc_name == "konsole" || $proc_name == "xterm" ]]; then
    is_terminal=1
else
    is_terminal=0
fi

# If TexXpander directory does not exist, create it
if [ ! -d "${texxpander_dir}" ]; then
    mkdir -p "${texxpander_dir}"
fi

# Store base directory path, expand complete path using TexXpander_dir variable
base_dir=$(realpath "${texxpander_dir}")

# Set globstar shell option (turn on) ** for filename matching glob patterns on subdirectories of TexXpander directory
shopt -s globstar

# Find regular files in base_dir, excluding those within directories or files that start with a "-", and pipe output to sed
names_list=$(find "${base_dir}" -type d -name '-*' -prune -o -type f ! -name '-*' -print | sort | sed "s?^${base_dir}/??g")

name=$(echo -e "${names_list}" | zenity --list --title=TexXpander --width=300 --height=400 --column=Abbreviations --ok-label="Insert") || exit

path="${base_dir}/${name}"

if [ -f "${path}" ]
then
    # Preserve the current value of the clipboard in a temporary file so
    # that trailing newlines are retained when restoring later
    clipboard_file=$(mktemp)
    xsel -b -o > "$clipboard_file"

    # Put text in primary buffer for Shift+Insert pasting
    # Read the file directly so that trailing newlines are preserved
    xsel -p -i < "$path"

    # Put text in clipboard selection for apps like Firefox that 
    # insist on using the clipboard for all pasting
    xsel -b -i < "$path"

    # Paste text into current active window
    sleep 0.3
    if [ $is_terminal -eq 1 ]; then
	xdotool key ctrl+shift+v
    else
        xdotool key shift+Insert
    fi

    # Restore the original value of the clipboard
    sleep 0.5
    xsel -b -i < "$clipboard_file"
    rm -f "$clipboard_file"
fi
