#!/bin/env bash

# Script to set wallpapers on GNOME
# Inspired by Mohd Sohail's script:
# https://www.linuxandubuntu.com/home/how-to-automatically-change-gnome-background-in-intervals-using-bash

# Don't return errors if no files are found
shopt -s nullglob

wallpaper_path="$HOME/Pictures/Wallpapers"
img_formats=(jpg jpeg jxl png apng bmp svg tif tiff webp avif heic)

while true; do
  # Set images array
  wallpapers=()
  for f in "${!img_formats[@]}"; do
    wallpapers+=("$wallpaper_path/"*".${img_formats[$f]}")
  done

  wallpapers_size=${#wallpapers[*]}

  # Shuffle image indexes
  index=$(seq 0 $(("$wallpapers_size" - 1)) | shuf)
  for i in $index; do
    [[ -f ${wallpapers[$i]} ]] || break

    while true; do
      isFullscreen=$(gsettings --schemadir \
        "$XDG_DATA_HOME/gnome-shell/extensions/caffeine@patapon.info/schemas/" \
        get org.gnome.shell.extensions.caffeine toggle-state
      )
      keep_suspend=0
      if [[ "$isFullscreen" == true ]]; then
        sleep 5m
        keep_suspend=1
      fi
      [[ $keep_suspend == 0 ]] && break
    done

    : "$(date '+%H')"; hour="${_##0}"
    if (("$hour" >= 7 && "$hour" < 19)) && [[ "${wallpapers[$i]}" =~ nsfw|NSFW ]]; then
      continue
    fi

    # Replace spaces with `%20` for gsettings
    wp=${wallpapers[$i]// /%20}
    gsettings set org.gnome.desktop.background picture-uri "file://$wp"
    sleep 2
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$wp"
    sleep 3m
  done
done
