json.(@articles) do |article|
  json.id article.id
  json.thumbnail article.thumbnail
  json.title article.title
  json.text article.text
  json.username article.user.name
  json.userid article.user.id
  json.created_at article.created_at.strftime('%Y.%m.%d')
end
