#!/usr/bin/env bash
#
# Optimize images with jpeg-recompress - ssim

# Config - global
DIR_SCRIPT=$( dirname $0 )
source "$DIR_SCRIPT/config.sh"

# Config
DIRNAME_CUSTOM="jpeg-recompress-ssim"

DIR_OUTPUT="$DIR_IMG/$DIRNAME_CUSTOM"

# Create dirs if not already
[ ! -d $DIR_OUTPUT ] && mkdir -p $DIR_OUTPUT

# Run jobs - optimize and copy
ladon -m "$DIR_OUTPUT/RELDIR" "$DIR_ORIG_PARENT/**/*.jpg" -- jpeg-recompress --strip --method ssim FULLPATH "$DIR_OUTPUT/RELPATH"
