require './url_models'
require 'net/http'

Dir.mkdir('articles') unless Dir.exist?('articles')

Qdaily.articles.find_each do |article|
  next unless article.article_id
  raw = Net::HTTP.get(article.url)
  IO.write("articles/#{article.article_id}", raw)
  p article.url
end
