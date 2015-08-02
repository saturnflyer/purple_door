require "test_helper"

feature "User sign in" do
  scenario "user enters valid sign-in credentials" do
    visit root_path
    page.must_have_content "Hello World"
    page.wont_have_content "Goobye All!"
  end
end
