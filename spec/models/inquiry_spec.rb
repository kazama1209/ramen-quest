require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  
  describe "Factories" do
    # 有効なファクトリを持つ
    it "is valid with valid factory" do
      expect(build(:inquiry)).to be_valid
    end
  end
  
  describe "Validations" do
    # 名前がなければ無効
    it { is_expected.to validate_presence_of(:name) }
    
    # 仮名がなければ無効
    it { is_expected.to validate_presence_of(:kana) }
  
    # メールアドレスがなければ無効
    it { is_expected.to validate_presence_of(:email) }
    
    # 本文がなければ無効
    it { is_expected.to validate_presence_of(:content) }
  end
end
