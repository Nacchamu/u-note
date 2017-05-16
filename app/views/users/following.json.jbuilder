json.(@followings) do |following|
  json.name following.followed.name
end