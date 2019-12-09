# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = Settings.service.default_host

SitemapGenerator::Sitemap.create do
  add articles_path, priority: 0.7, changefreq: 'daily'
  add reviews_path, priority: 0.7, changefreq: 'daily'
  add ramen_shops_path, priority: 0.7, changefreq: 'daily'
  
  Article.find_each do |article|
    add article_path(article), priority: 1.0, lastmod: article.updated_at, changefreq: 'daily'
  end
  
  Review.find_each do |review|
    add review_path(review), priority: 1.0, lastmod: review.updated_at, changefreq: 'daily'
  end
  
  RamenShop.find_each do |ramen_shop|
    add ramen_shop_path(ramen_shop), priority: 1.0, lastmod: ramen_shop.updated_at, changefreq: 'daily'
  end
end