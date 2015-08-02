require "test_helper"

feature "User sign in" do
  scenario "user enters valid sign-in credentials" do
    visit '/users/sign_in'

    page.must_have_content "Home"
    page.wont_have_content "Sign in"
  end
end
