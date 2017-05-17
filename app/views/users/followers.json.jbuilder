json.(@followers) do |follower|
  json.name follower.follower.name
end