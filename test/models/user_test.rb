require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:valid)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'check for other users' do
    assert_includes @user.other_users, users(:two)
  end

  test 'check for friends' do
    assert_includes @user.friends, users(:three)
  end
end
