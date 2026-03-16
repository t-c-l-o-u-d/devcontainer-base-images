#!/usr/bin/env bash

# closure notice
if [ "$PS1" != "" ] && [ -f /etc/motd ]; then
    __closure_notice() {
        cat /etc/motd
        echo
    }
    if [ "$PROMPT_COMMAND" != "" ]; then
        PROMPT_COMMAND="__closure_notice;${PROMPT_COMMAND}"
    else
        PROMPT_COMMAND="__closure_notice"
    fi
fi
