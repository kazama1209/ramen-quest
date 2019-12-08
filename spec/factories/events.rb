FactoryBot.define do
  factory :event do
    id { 1 }
    title { 'テスト' }
    start_time { '2019-12-01 10:00:00' }
    user_id { 2 }
  end
end