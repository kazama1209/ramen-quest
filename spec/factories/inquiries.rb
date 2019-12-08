FactoryBot.define do
  factory :inquiry do
    name { '試験 太郎' }
    kana { 'テスト タロウ' }
    email { 'user@example.com' }
    content { 'テスト送信' }
  end
end
