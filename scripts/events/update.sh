curl --include --request PATCH "http://localhost:4741/events/${ID}" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "event": {
      "date": "'"${DATE}"'",
      "time": "'"${TIME}"'"
    }
  }'
