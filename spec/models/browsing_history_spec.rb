require 'rails_helper'

RSpec.describe BrowsingHistory, type: :model do
  
  describe "Factories" do
    # 有効なファクトリを持つ
    it "is valid with valid factory" do
      create(:user)
      create(:ramen_shop)
      expect(build(:browsing_history)).to be_valid
    end
  end
  
  describe "Validations" do
    # ユーザーIDがなければ無効
    it { is_expected.to validate_presence_of(:user_id) }
    
    # ラーメン店IDがなければ無効
    it { is_expected.to validate_presence_of(:ramen_shop_id) }
  end
  
  describe "Associations" do
    # 以下の関連を持つ
    it { should belong_to(:user) }
    it { should belong_to(:ramen_shop) }
  end
end
