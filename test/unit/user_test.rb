require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @invalid_user = User.new
    @invalid_user.valid?
  end
  test "should fail if user has wrong email format" do
    assert_true @invalid_user.errors[:email].present?
  end
end
