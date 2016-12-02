require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save without username" do
    user = User.new
    assert_not user.save, "Save with no username"
  end

end
