curl --include --request POST "http://localhost:4741/events" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "event": {
      "name": "'"${NAME}"'",
      "date": "'"${DATE}"'",
      "time": "'"${TIME}"'",
      "location": "'"${LOC}"'",
      "description": "'"${DESC}"'"
    }
  }'
