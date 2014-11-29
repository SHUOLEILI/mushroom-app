json.array!(@consumers) do |consumer|
  json.extract! consumer, :email, :username, password, :id, :name, :geneder, :age
  json.url consumer_url(consumer, format: :json)
end
