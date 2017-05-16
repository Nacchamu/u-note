json.(@followings) do |following|
  json.name following.followed.article
end