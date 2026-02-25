#!/usr/bin/env bash

export LC_ALL=C.UTF-8   # force UTF-8 в скрипте

cava -p ~/.config/cava/config | while IFS= read -r line; do
    bars=""
    IFS=';' read -ra levels <<< "$line"
    for level in "${levels[@]}"; do
        case $level in
            0|1) bars+="▁" ;;
            2)   bars+="▂" ;;
            3)   bars+="▃" ;;
            4)   bars+="▄" ;;
            5)   bars+="▅" ;;
            6)   bars+="▆" ;;
            7)   bars+="▇" ;;
            *)   bars+="█" ;;
        esac
    done
    echo "$bars"
done
