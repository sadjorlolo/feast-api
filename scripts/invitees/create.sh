curl --include --request POST "http://localhost:4741/invitees" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "invitee": {
      "user_id": "'"${USER}"'",
      "event_id": "'"${EVENT}"'"
    }
  }'
