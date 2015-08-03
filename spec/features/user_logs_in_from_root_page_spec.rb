require "rails_helper"

RSpec.feature "User authentication", type: :feature do 
  let(:login_user) { FactoryGirl.create(:user) }

  feature "User visits root page" do
    scenario "successfully" do 
      visit root_path 

      expect(page).to have_content('Home')
    end
  end 

  feature "User logs in" do 
    scenario "successfully" do
      visit root_path

      log_in_as(login_user.email, login_user.password)

      expect(page).to have_content('Signed in successfully.')
      expect(page).not_to have_content('Sign in')
    end
  end
end