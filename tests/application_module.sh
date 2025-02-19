#!/usr/bin/env bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
# shellcheck disable=SC1091
source "${script_dir}/helpers.sh"

# Tests that the default options are set correctly
tmux source "${script_dir}/../gruvbox_options_tmux.conf"
tmux source "${script_dir}/../gruvbox_tmux.conf"

print_option @gruvbox_status_application | grep -q "@thm_" &&
  echo "@gruvbox_status_application did not expand all colors"

print_option @gruvbox_status_application | sed -E 's/(bash|fish|zsh)/<application>/'
