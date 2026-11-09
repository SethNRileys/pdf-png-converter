#!/bin/bash
# Запускає локальний сервер і відкриває додаток у браузері.
set -e
cd "$(dirname "$0")"
PORT="${PORT:-8743}"

python3 -m http.server "$PORT" &
SERVER_PID=$!
trap "kill $SERVER_PID 2>/dev/null" EXIT

sleep 1
open "http://localhost:$PORT/pdf-splitter.html"

wait "$SERVER_PID"
