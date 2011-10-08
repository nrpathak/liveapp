require 'test_helper'
#fixtures :users
class UserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

  test  "test_invalid_with_empty_attributes"   do
    user = User.new
    assert_false user.save
  end

  test "test_password_valid" do
    user = User.new(:user_name => "nrpilp",
                       :password => "xyz",
                       :first_name=>"ipl",
                       :last_name=>"dhl",
                       :admin=>"false",
                       :email=> "text@mail.com"
                       )
    assert_false user.save
  end

  test "user_already_exists"  do
      user = User.new(:user_name => "ss",
                       :password => "password1",
                       :first_name=>"spt1",
                       :last_name=>"spt2",
                       :admin=>"false",
                       :email=> "email@email.com"
                       )
      assert_false user.save
  end

  test "successful_addition" do
          user = User.new(:user_name => "ajackson",
                       :password => "ajack02",
                       :first_name=>"mick",
                       :last_name=>"jackson",
                       :admin=>"false",
                       :email=> "argt@texas.com"
                       )
      assert_true user.save
  end
end

