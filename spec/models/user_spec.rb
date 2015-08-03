require "rails_helper"

RSpec.describe User do 
  describe "validations" do 
    it "has a valid factory for testing" do 
      user = FactoryGirl.create(:user)
      expect(user).to be_valid
    end

    it "is invalid without a first name" do 
      user = FactoryGirl.build(:user, first_name: nil)
      expect(user).not_to be_valid
    end

    it "is invalid without a last name" do 
      user = FactoryGirl.build(:user, last_name: nil)
      expect(user).not_to be_valid
    end

    it "is invalid without an email" do 
      user = FactoryGirl.build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it "is invalid without a unique email" do 
      user1 = FactoryGirl.create(:user, email: 'notunique@email.com')
      user2 = FactoryGirl.build(:user, email: 'notunique@email.com')

      expect(user1).to be_valid
      expect(user2).not_to be_valid
    end
  end

  describe ".full_name" do 
    it "returns a user's full name as a string" do 
      user = FactoryGirl.create(:user)
      expect(user.full_name).to eq(user.first_name + " " + user.last_name)
      expect(user.full_name).to eq("John Doe")
    end
  end

  describe ".admin?" do 
    it "returns true if a user has permissions" do 
      user = FactoryGirl.build(:user, permissions: ["superuser"])
      expect(user.admin?).to be_truthy
    end

    it "returns false if a user does not have permissions" do 
      user = FactoryGirl.create(:user, permissions: [])
      expect(user.admin?).to be_falsy
    end
  end

  describe ".employee" do 
    it "returns true if a user has no permissions" do 
      user = FactoryGirl.create(:user, permissions: [])
      expect(user.employee?).to be_truthy
    end

    it "returns false if a user has permissions" do 
      user = FactoryGirl.create(:user, permissions: ["superuser"])
      expect(user.employee?).to be_falsy
    end
  end

  context "validations" do 
    before { FactoryGirl.build(:user) }

    it do 
      should have_many(:events)
    end

    it do 
      should have_many(:user_worksheets)
    end
  end
end



