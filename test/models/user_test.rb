require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "invalid without an email" do
    t = User.create
    assert !t.valid?
  end

  test "valid with all attributes" do
    t = users(:john)
    assert t.valid?, "User is not valid"
  end
end