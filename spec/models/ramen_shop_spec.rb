require 'rails_helper'

RSpec.describe RamenShop, type: :model do
  
  describe "Factories" do
    # 有効なファクトリを持つ
    it "is valid with valid factory" do
      expect(build(:ramen_shop)).to be_valid
    end
  end
  
  describe "Validations" do
    # 名前がなければ無効
    it { is_expected.to validate_presence_of(:name) }
    
    # 都道府県がなければ無効
    it { is_expected.to validate_presence_of(:prefecture) }
    
    # 所在地がなければ無効
    it { is_expected.to validate_presence_of(:address) }
    
    # 電話番号がなければ無効
    it { is_expected.to validate_presence_of(:phone) }
    
    # 写真号がなければ無効
    it { is_expected.to validate_presence_of(:image) }
  end
  
  describe "Associations" do
    # 以下の関連を持つ
    it { should have_many(:reviews)}
    it { should have_many(:bookmarks)}
    it { should have_many(:completions)}
    it { should have_many(:browsing_histories)}
  end
end
