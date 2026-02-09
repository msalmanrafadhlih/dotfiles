#!/usr/bin/env bash

kdocker -f -q chromium --user-data-dir=$HOME/.config/vivaldi/youtube --app="https://www.reddit.com" --class=youtube &

#surf "https://www.reddit.com"
