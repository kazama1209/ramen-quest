require 'rails_helper'

RSpec.describe Like, type: :model do
  
  describe "Factories" do
    # 有効なファクトリを持つ
    it "is valid with valid factory" do
      create(:user)
      create(:ramen_shop)
      create(:review)
      expect(build(:like)).to be_valid
    end
  end
  
  describe "Validations" do
    # ユーザーIDがなければ無効
    it { is_expected.to validate_presence_of(:user_id) }
    
    # レビューIDがなければ無効
    it { is_expected.to validate_presence_of(:review_id) }
  end
  
  describe "Associations" do
    # 以下の関連を持つ
    it { should belong_to(:user) }
    it { should belong_to(:review) }
  end
end
