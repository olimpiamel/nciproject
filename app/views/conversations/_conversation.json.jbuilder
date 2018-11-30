json.extract! conversation, :id, :sender, :receiver, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
