curl --include --request PATCH "http://localhost:4741/invitees/${ID}" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "invitee": {
      "user_id": "'"${USER}"'",
      "event_id": "'"${EVENT}"'"
    }
  }'
