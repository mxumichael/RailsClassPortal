json.array!(@materials) do |material|
  json.extract! material, :id, :title, :description, :type
  json.url material_url(material, format: :json)
end
