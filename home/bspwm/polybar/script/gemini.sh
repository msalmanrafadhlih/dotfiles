#!/usr/bin/env bash

kdocker -q -f chromium --user-data-dir=$HOME/.config/vivaldi/ChatAi --app="https://gemini.google.com" --class=GeminiAi &


#surf -K "https://gemini.google.com"
