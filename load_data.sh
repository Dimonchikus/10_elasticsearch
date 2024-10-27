#!/bin/bash

while IFS= read -r word; do
  # Remove any non-printable characters (e.g., carriage returns)
  cleaned_word=$(echo "$word" | tr -d '[:cntrl:]')

  # Check if the cleaned word is non-empty before indexing
  if [[ -n "$cleaned_word" ]]; then
    curl -X POST "localhost:9200/autocomplete/_doc/" -H 'Content-Type: application/json' -d "{
      \"word\": \"$cleaned_word\"
    }"
  fi
done < words.txt
