json.(@followings) do |following|
  json.avatar following.followed.avatar
  json.name following.followed.name
  json.profiel following.followed.profiel
  json.id following.followed.id
end