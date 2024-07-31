#!/bin/env bash

wallpaper_folder="$HOME/Pictures/Wallpapers"
wallpaper_location="$(ls "$wallpaper_folder" | sort | rofi -dmenu -hover-select -me-select-entry '' -me-accept-entry MousePrimary -p "Wallpaper:")"

# Construct the wallpaper path
wallpaper_path="$wallpaper_folder/$wallpaper_location"


if [[ -f "$wallpaper_path" ]]; then
    swww img --transition-type grow --transition-pos top --transition-duration 0.5 --transition-fps 60 "$wallpaper_path"
    sleep 0.7
    ~/.local/bin/wal -i "$wallpaper_path"
    sleep 0.3
    pkill waybar
    hyprctl dispatch exec waybar
    sleep 0.5
    notify-send -u normal "Changed Wallpaper" "Wallpaper and color palette were updated successfully!"
else

    exit 1
fi
