module Features
  def log_in_as(email, password)
    click_on "Sign in"
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_on "Sign in"
  end
end