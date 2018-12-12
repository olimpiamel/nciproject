json.extract! booking, :id, :id, :start_Date, :end_Date, :property_id, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
