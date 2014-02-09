json.array!(@themas) do |thema|
  json.extract! thema, :id, :title, :description, :lastact
  json.url thema_url(thema, format: :json)
end
