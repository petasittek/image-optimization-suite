#!/usr/bin/env bash
#
# Optimize images with mozcjpeg

# Config - global
DIR_SCRIPT=$( dirname $0 )
source "$DIR_SCRIPT/config.sh"

# Config
DIRNAME_CUSTOM="mozcjpeg"

DIR_OUTPUT="$DIR_IMG/$DIRNAME_CUSTOM"

# Create dirs if not already
[ ! -d $DIR_OUTPUT ] && mkdir -p $DIR_OUTPUT

# Run jobs - copy and replace in-place the copied files
ladon -m "$DIR_OUTPUT/RELDIR" "$DIR_ORIG_PARENT/**/*.jpg" -- mozcjpeg -optimize -outfile "$DIR_OUTPUT/RELPATH" FULLPATH
