require "test_helper"

feature "User sign in" do
  scenario "user signs in with valid credentials" do
    visit '/users/sign_in'

    within '.new_user' do
      fill_in 'user_email',    with: 'user@aol.com'
      fill_in 'user_password', with: 'abc1234567'
      click_button 'Log in'
    end

    page.must_have_content " "
    page.wont_have_content "Sign in"
  end
end
