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

  test 'initiate a profile after user is created' do
    user = User.create({name:'pipo', email:'pipo@pipo.com', password:'pipopi'})
    assert_instance_of Profile, user.profile
  end
end
