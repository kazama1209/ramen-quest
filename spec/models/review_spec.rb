require 'rails_helper'

RSpec.describe Review, type: :model do
  
  describe "Factories" do
    # 有効なファクトリを持つ
    it "is valid with valid factory" do
      create(:user)
      create(:ramen_shop)
      expect(build(:review)).to be_valid
    end
  end
  
  describe "Validations" do
    # ラーメン店の名前がなければ無効
    it { is_expected.to validate_presence_of(:shop_name) }
    
    # 都道府県がなければ無効
    it { is_expected.to validate_presence_of(:prefecture) }
    
    # 所在地がなければ無効
    it { is_expected.to validate_presence_of(:address) }
    
    # タイトルがなければ無効
    it { is_expected.to validate_presence_of(:title) }
    
    # 評価がなければ無効
    it { is_expected.to validate_presence_of(:rate) }
    
    # 本文がなければ無効
    it { is_expected.to validate_presence_of(:body) }
  end
  
  describe "Associations" do
    # 以下の関連を持つ
    it { should belong_to(:user)}
    it { should belong_to(:ramen_shop)}
    it { should have_many(:likes)}
  end
end

