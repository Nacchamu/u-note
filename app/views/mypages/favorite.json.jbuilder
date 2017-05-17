json.(@favorites) do |favorite|
  json.thumbnail favorite.article.thumbnail
  json.title favorite.article.title
  json.text favorite.article.text
  json.username favorite.article.user.name
  json.created_at favorite.article.created_at.strftime('%Y年%m月%d日 %H時%M分')
end