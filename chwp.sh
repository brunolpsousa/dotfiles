#!/bin/env bash

# Script to set wallpapers on GNOME
# Originally made by Mohd Sohail:
# https://www.linuxandubuntu.com/home/how-to-automatically-change-gnome-background-in-intervals-using-bash

# Do not return errors if no file is found
shopt -s nullglob

wallpaper_path="$HOME/Pictures/Wallpapers"
img_formats=(jpg jpeg jxl png apng bmp svg tif tiff webp avif heic)

# Sets the array of images
for f in "${!img_formats[@]}"; do
  wallpapers+=("$wallpaper_path/"*".${img_formats[$f]}")
done

wallpapers_size=${#wallpapers[*]}

while true; do
  # Gets the index of the images in the array and shuffles it. This way we get random
  # unique images. Outside the 'for' loop so the array is reshuffled at the end
  index=$(seq 0 $(("$wallpapers_size" - 1)) | shuf)
  for i in $index; do
    # Replace spaces with '%20' so gsettings can set it correctly
    wp=${wallpapers[$i]// /%20}
    gsettings set org.gnome.desktop.background picture-uri "file://$wp"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$wp"
    sleep 3m
  done
done
