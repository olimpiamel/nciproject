json.extract! user, :id, :name, :surname, :email, :password, :phone, :created_at, :updated_at, :address
json.url user_url(user, format: :json)
