json.(@followers) do |follower|
  json.avatar follower.follower.avatar
  json.name follower.follower.name
  json.profiel follower.follower.profiel
  json.id follower.follower.id
end