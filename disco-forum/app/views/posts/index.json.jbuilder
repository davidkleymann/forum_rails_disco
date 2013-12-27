json.array!(@posts) do |post|
  json.extract! post, :id, :title, :htext, :time, :user
  json.url post_url(post, format: :json)
end
