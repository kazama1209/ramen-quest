require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Factories" do
    # 有効なファクトリを持つ(管理者)
    it "is valid with valid factory" do
      expect(build(:admin)).to be_valid
    end
    
    # 有効なファクトリを持つ(一般ユーザー)
    it "is valid with valid factory" do
      expect(build(:user)).to be_valid
    end
  end
  
  describe "Validations" do
    # メールアドレスがなければ無効
    it { is_expected.to validate_presence_of(:email) }
    
    # パスワード(8文字以上)がなければ無効
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  
    # 確認用パスワードがなければ無効
    it { is_expected.to validate_presence_of(:password_confirmation) }
  end
end