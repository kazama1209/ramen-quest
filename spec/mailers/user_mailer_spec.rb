require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  
  let(:user) { build(:user) }
  
  describe 'activation_needed_email' do
    
    let(:mail) { UserMailer.activation_needed_email(user).deliver_now }
    
    # メールヘッダーに以下の内容を含む
    it 'renders the headers' do
      expect(mail.subject).to eq('ユーザー登録のご案内')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
    end
    
    # メールの送信に成功する
    it 'sends an email' do
      expect{ (mail) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  describe 'activation_success_email' do
    
    let(:mail) { UserMailer.activation_success_email(user).deliver_now }
    
    # メールヘッダーに以下の内容を含む
    it "renders the headers" do
      expect(mail.subject).to eq('ユーザー登録完了のご案内')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
    end
    
    # メールの送信に成功する
    it 'sends an email' do
      expect{ (mail) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end