#!/usr/bin/env bash

kdocker -f -q chromium --user-data-dir=$HOME/.config/vivaldi/ChatAi --app="https://chat.openai.com" --class=ChatAi &

#surf "https://chat.openai.com"
