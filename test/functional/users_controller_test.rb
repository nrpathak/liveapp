require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:two)
  end


  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {:id=> 18,:user_name=>'test_user3',:password => "123456", :first_name => "huiya", :last_name=>"jsdfht",
          :admin => "false",:post_count => 0, :email => 'huiya@ncsu.edu',:created_at=>nil,:updated_at => nil}
    end
      assert_redirected_to :controller => "users", :action => "login"
  end


  test "should get edit" do
    get :edit, id: @user.to_param
    assert_response :success
  end

  test "should update user" do
    put :update, id: 18, user: @user.attributes
    assert_redirected_to :controller => 'posts', :action=>'index'
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :delete_user, :id => 18
    end

    assert_redirected_to :controller => 'users', :action=>'manage_users'
  end

end
