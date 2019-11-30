module AuthenticationForFeatureRequest
  def login(user, password = '12341234')
    user.update(password: password, password_confirmation: password)

    page.driver.post login_index_url, user: { email: user.email, password: password }
  end
end