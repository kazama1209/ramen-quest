crumb :root do
  link "トップページ", root_path
end

crumb :inquirie_new do
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

crumb :about_privacy do
  link 'プライバシーポリシー', privacy_path
  parent :root
end

crumb :about_terms do
  link '利用規約', terms_path
  parent :root
end

crumb :admin_root do
  link 'ダッシュボード', admins_dashboard_index_path
end

crumb :mypage_dashbord do
  link 'マイページ', dashboard_index_path
  parent :root
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