crumb :root do
  link "トップページ", root_path
end

crumb :inquiry do
  link 'お問い合わせ', new_inquiry_path
  parent :root
end

crumb :signup do
  link 'ユーザー登録', new_signup_path
  parent :root
end

crumb :login do
  link 'ログイン', login_path
  parent :root
end

crumb :password_reset do
  link 'パスワード再設定', new_password_path
  parent :login
end

crumb :privacy do
  link 'プライバシーポリシー', privacy_path
  parent :root
end

crumb :terms do
  link '利用規約', terms_path
  parent :root
end

crumb :reviews do
  link 'みんなのレビュー', reviews_path
  parent :root
end

crumb :ramen_shops do
  link 'ラーメンデータベース', ramen_shops_path
  parent :root
end

crumb :new_ramen_shop do
  link '店舗情報追加', new_ramen_shop_path
  parent :ramen_shops
end

crumb :show_ramen_shop do |ramen_shop|
  link "#{ramen_shop.name}（#{ramen_shop.prefecture}）", ramen_shop_path(ramen_shop)
  parent :ramen_shops
end

crumb :ranking do
  link 'ランキング', ranking_index_path
  parent :root
end

crumb :new_review do
  link 'レビューを書く', new_review_path
  parent :reviews
end

crumb :show_review do |review|
  link "#{review.shop_name}（#{review.prefecture}）", review_path(review)
  parent :reviews
end

crumb :admin_root do
  link 'ダッシュボード', admins_dashboard_index_path
end

crumb :mypage_dashbord do
  link 'マイページ', dashboard_index_path
  parent :root
end

crumb :mypage_review do
  link '自分のレビュー', mypage_review_path
  parent :mypage_dashbord
end

crumb :mypage_profile do
  link 'プロフィール', mypage_profile_path
  parent :mypage_dashbord
end

crumb :mypage_email do
  link 'メールアドレス', mypage_email_path
  parent :mypage_dashbord
end

crumb :mypage_password do
  link 'パスワード', mypage_password_path
  parent :mypage_dashbord
end

crumb :user_profile do
  link 'プロフィール'
  parent :user_index
end