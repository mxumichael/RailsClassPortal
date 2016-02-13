json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :is_student, :is_admin, :is_instructor
  json.url user_url(user, format: :json)
end
