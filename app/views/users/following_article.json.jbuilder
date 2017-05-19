json.(@articles) do |article|
  json.thumbnail article.thumbnail
  json.id article.id
  json.text article.text
  json.title article.title
  json.username article.user.name
  json.userid article.user.id
  json.created_at article.created_at.strftime('%Y.%m.%d')
end
