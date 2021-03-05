json.extract! client, :id, :photo, :first_name, :last_name, :phone, :bio, :user_id, :account_id, :created_at, :updated_at
json.url client_url(client, format: :json)
