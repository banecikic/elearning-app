json.extract! account, :id, :status, :account_tipe, :service, :booking_id, :user_id, :created_at, :updated_at
json.url account_url(account, format: :json)
