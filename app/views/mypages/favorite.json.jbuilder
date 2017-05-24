json.(@favorites) do |favorite|
  json.thumbnail favorite.article.thumbnail
  json.id favorite.article.id
  json.title favorite.article.title
  json.text favorite.article.text
  json.username favorite.article.user.name
  json.userid favorite.article.user.id
  json.created_at favorite.article.created_at.strftime('%Y.%m.%d')
end