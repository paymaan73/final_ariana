json.extract! profile, :id, :firstname, :lastname, :address, :tell, :created_at, :updated_at
json.url profile_url(profile, format: :json)
