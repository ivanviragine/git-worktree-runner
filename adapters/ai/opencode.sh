#!/usr/bin/env bash
# OpenCode adapter

# Check if OpenCode is available
ai_can_start() {
  command -v opencode >/dev/null 2>&1
}

# Start OpenCode in a directory
# Usage: ai_start path [args...]
ai_start() {
  local path="$1"
  shift

  if ! ai_can_start; then
    log_error "OpenCode not found. Install from https://opencode.ai"
    log_info "Make sure the 'opencode' CLI is available in your PATH"
    return 1
  fi

  if [ ! -d "$path" ]; then
    log_error "Directory not found: $path"
    return 1
  fi

  # Change to the directory and run opencode with any additional arguments
  (cd "$path" && opencode "$@")
}

