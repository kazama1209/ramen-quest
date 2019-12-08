require 'rails_helper'

RSpec.describe Article, type: :model do
  
  describe "Factories" do
    # 有効なファクトリを持つ
    it "is valid with valid factory" do
      expect(build(:article)).to be_valid
    end
  end
  
  describe "Validations" do
    # タイトルがなければ無効
    it { is_expected.to validate_presence_of(:title) }
    
    # 本文がなければ無効
    it { is_expected.to validate_presence_of(:body) }
  end
end
