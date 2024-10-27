#!/bin/bash

QUERY=$1

curl -X GET "localhost:9200/autocomplete/_search" -H 'Content-Type: application/json' -d "{
  \"query\": {
    \"match\": {
      \"word\": {
        \"query\": \"$QUERY\",
        \"fuzziness\": \"AUTO\",
        \"prefix_length\": 1
      }
    }
  },
  \"size\": 5
}"
