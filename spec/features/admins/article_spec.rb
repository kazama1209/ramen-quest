require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  let(:user) { create(:admin) }
  let(:article) { create(:article) }
  
  feature 'Visit' do
    
    before(:each) do
      login(user)
      visit admins_dashboard_index_path
    end
    
    # 記事一覧ページ
    it 'Articles' do
      login(user)
      visit admins_articles_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq admins_articles_path
      expect(page).to have_text '記事'
    end
    
    # 記事新規作成ページ
    it 'New article' do
      login(user)
      visit new_admins_article_path
      expect(page).to have_http_status :ok
      expect(current_path).to eq new_admins_article_path
      expect(page).to have_text '記事作成'
    end
    
    # 記事編集ページ
    it  'Edit article' do
      login(user)
      visit edit_admins_article_path(article)
      expect(page).to have_http_status :ok
      expect(current_path).to eq edit_admins_article_path(article)
      expect(page).to have_text '記事の編集'
    end
  end
  
  feature 'Controll' do
    
    before(:each) do
      login(user)
    end
    
    # 記事の新規作成
    it 'Creates new article' do
      visit new_admins_article_path
      
      select '割引キャンペーン', from: 'article_category'
      fill_in 'タイトル', with: 'テスト'
      fill_in 'メタディスクリプション', with: 'テスト'
      fill_in '本文 ', with: 'テスト'
      
      find_by_id('article_image').click
      attach_file('article[image]', 'spec/fixtures/test.jpg')
      
      expect do
        click_on '登録する' 
      
        expect(page).to have_http_status :ok
        expect(current_path).to eq admins_articles_path
      end.to change(Article, :count).by 1
    end
    
    # 記事の編集
    it 'Updates article' do
      visit edit_admins_article_path(article)
      
      select '割引キャンペーン', from: 'article_category'
      fill_in 'タイトル', with: 'test'
      fill_in 'メタディスクリプション', with: 'test'
      fill_in '本文 ', with: 'test'
      
      find_by_id('article_image').click
      attach_file('article[image]', 'spec/fixtures/test.jpg')
      
      click_on '更新する' 
    
      expect(page).to have_http_status :ok
      expect(current_path).to eq admins_articles_path
      expect(page).to have_text 'test'
    end
  end
end