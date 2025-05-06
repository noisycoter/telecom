#!/bin/bash
URLS=(
  "https://httpstat.us/200"
  "https://httpstat.us/101"
  "https://httpstat.us/302"
  "https://httpstat.us/404"
  "https://httpstat.us/520"
)

for url in "${URLS[@]}"; do
  response=$(curl -is "$url")
  status_code=$(echo "$response" | head -n 1 | cut -d' ' -f 2)
  
  if [[ $status_code =~ ^[123][0-9]{2}$ ]]; then
    echo "SUCCESS: Status $status_code"
    echo "Body: $(echo "$response" | awk 'NR==1{next} /^$/ {exit} {print}')"
  else
    >&2 echo "ERROR: Status $status_code"
    >&2 echo "Body: $(echo "$response" | awk 'NR==1{next} /^$/ {exit} {print}')"
    exit 1
  fi
done