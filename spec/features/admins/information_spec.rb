require 'rails_helper'

RSpec.feature "Informations", type: :feature do
  let(:user) { create(:admin) }
  let(:information) { create(:information) }
  
  feature 'Visit' do
    
    before(:each) do
      login(user)
      visit admins_dashboard_index_path
    end
    
    # お知らせ一覧ページ
    it 'Informations' do
      login(user)
      visit admins_informations_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq admins_informations_path
      expect(page).to have_text 'お知らせ'
    end
    
    # お知らせ新規作成ページ
    it 'New information' do
      login(user)
      visit new_admins_information_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq new_admins_information_path
      expect(page).to have_text 'お知らせ作成'
    end
  end
  
  feature 'Controll' do
    
    before(:each) do
      login(user)
    end
    
    # 記事の新規作成
    it 'Creates new information' do
      visit new_admins_information_path
      
      fill_in 'タイトル', with: 'テスト'
      fill_in '本文 ', with: 'テスト'
      
      find_by_id('information_image').click
      attach_file('information[image]', 'spec/fixtures/test.jpg')
      
      expect do
        click_on '登録する' 
      
        expect(page).to have_http_status :ok
        expect(current_path).to eq admins_informations_path
      end.to change(Information, :count).by 1
    end
    
    # 記事の編集
    it 'Updates information' do
      visit edit_admins_information_path(information)
      
      fill_in 'タイトル', with: 'test'
      fill_in '本文 ', with: 'test'
      
      find_by_id('information_image').click
      attach_file('information[image]', 'spec/fixtures/test.jpg')
      
      click_on '更新する' 
    
      expect(page).to have_http_status :ok
      expect(current_path).to eq admins_informations_path
      expect(page).to have_text 'test'
    end
  end
end