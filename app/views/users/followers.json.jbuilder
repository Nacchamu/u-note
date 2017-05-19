json.(@followers) do |follower|
  json.avatar follower.follower.avatar
  json.name follower.follower.name
  json.avatar follower.follower.avatar
  json.id follower.follower.id
end