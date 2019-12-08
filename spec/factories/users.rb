FactoryBot.define do
  factory :admin, class: User do
    id { 1 }
    email { 'admin@example.com' }
    password { '12341234' }
    password_confirmation { '12341234' }
    name { 'admin' }
    profile { '管理者です。' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    role { 200 }
    
    after(:create) do |admin|
      admin.activate!
    end
  end
  
  factory :user do
    id { 2 }
    email { 'user@example.com' }
    name { 'ユーザー' }
    password { '12341234' }
    password_confirmation { '12341234' } 
    profile { 'よろしくお願いします。' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    role { 0 }
    
    after(:create) do |user|
      user.activate!
    end
  end
end