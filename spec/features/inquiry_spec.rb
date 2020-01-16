require 'rails_helper'

RSpec.feature "Inquiries", type: :feature do
  
  feature 'Visit' do
    
    # お問い合わせフォーム
    it 'Inquiry Form' do
      visit new_inquiry_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq new_inquiry_path
      
      expect(page).to have_text 'お問い合わせ内容'
    end
  end
  
  # feature 'Controll' do
    
  #   # 問い合わせ送信に成功
  #   it 'sends inquiry successfully' do
  #     visit new_inquiry_path
  #     fill_in 'inquiry_name', with: '試験 太郎'
  #     fill_in 'inquiry_kana', with: 'テスト タロウ'
  #     fill_in 'inquiry_email', with: 'test@gmail.com'
  #     fill_in 'inquiry_content', with: 'テスト送信'
      
  #     expect do
  #       click_on '送信する'
      
  #       expect(page).to have_http_status :ok
  #       expect(current_path).to eq complete_inquiries_path
  #       expect(page).to have_text '受付が完了しました'
  #     end.to change(Inquiry, :count).by 1
  #   end
  # end
end