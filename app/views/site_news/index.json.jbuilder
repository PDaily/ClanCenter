json.array!(@site_news) do |site_news|
  json.extract! site_news, :id, :title, :body, :belongs_to
  json.url site_news_url(site_news, format: :json)
end
