#!/bin/bash

QUERY=$1

# Determine fuzziness level based on word length
WORD_LENGTH=${#QUERY}
if (( WORD_LENGTH > 7 )); then
  FUZZINESS=3
else
  FUZZINESS="AUTO"
fi

curl -X GET "localhost:9200/autocomplete/_search" -H 'Content-Type: application/json' -d "{
  \"query\": {
    \"match\": {
      \"word\": {
        \"query\": \"$QUERY\",
        \"fuzziness\": \"$FUZZINESS\",
        \"prefix_length\": 1
      }
    }
  },
  \"size\": 5
}"
