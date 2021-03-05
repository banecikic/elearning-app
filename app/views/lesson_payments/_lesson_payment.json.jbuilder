json.extract! lesson_payment, :id, :payment_number, :status, :date, :cost, :service, :booking_id, :account_id, :created_at, :updated_at
json.url lesson_payment_url(lesson_payment, format: :json)
