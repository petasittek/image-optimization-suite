#!/usr/bin/env bash
#
# Optimize images with jpegoptim

# Config - global
DIR_SCRIPT=$( dirname $0 )
source "$DIR_SCRIPT/config.sh"

# Config
DIRNAME_CUSTOM="jpegoptim"

DIR_OUTPUT="$DIR_IMG/$DIRNAME_CUSTOM"

# Create dirs if not already
[ ! -d $DIR_OUTPUT ] && mkdir -p $DIR_OUTPUT

# Run jobs - copy and replace in-place the copied files
rsync -avr $DIR_ORIG_PARENT/ $DIR_OUTPUT/
ladon -m "$DIR_OUTPUT/RELDIR" "$DIR_OUTPUT/**/*.jpg" -- jpegoptim --strip-all --overwrite FULLPATH
