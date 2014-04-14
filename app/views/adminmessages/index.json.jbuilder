json.array!(@adminmessages) do |adminmessage|
  json.extract! adminmessage, :id :message, :user
  json.url adminmessage_url(adminmessage, format: :json)
end
