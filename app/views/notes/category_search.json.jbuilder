json.(@articles) do |article|
  json.id article.id
  json.thumbnail article.thumbnail
  json.title article.title
  json.text article.text
  json.username article.user.name
  json.created_at article.created_at.strftime('%Y年%m月%d日 %H時%M分')
end
