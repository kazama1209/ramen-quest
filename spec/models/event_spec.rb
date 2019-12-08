require 'rails_helper'

RSpec.describe Event, type: :model do
  
  describe "Factories" do
    # 有効なファクトリを持つ
    it "is valid with valid factory" do
      create(:user)
      expect(build(:event)).to be_valid
    end
  end
  
  describe "Validations" do
    # タイトルがなければ無効
    it { is_expected.to validate_presence_of(:title) }
    
    # ユーザーIDがなければ無効
    it { is_expected.to validate_presence_of(:user_id) }
    
    # 日時がなければ無効
    it { is_expected.to validate_presence_of(:start_time) }
    
  end
  
  describe "Associations" do
    # 以下の関連を持つ
    it { should belong_to(:user) }
  end
end
