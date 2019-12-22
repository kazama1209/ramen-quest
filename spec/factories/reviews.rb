FactoryBot.define do
  factory :review do
    id { 1 }
    user_id { 2 }
    ramen_shop_id { 1 }
    shop_name { 'ほげラーメン' }
    prefecture { 13 } # 東京
    address { 'ほげ市ほげ丁目123-456' }
    title { '絶品ラーメン' }
    rate { 5 }
    body { '美味しかったです。' }
    image1 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end
end