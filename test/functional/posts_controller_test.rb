require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    session[:user_id] = User.find_by_user_name("harry123")
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: @post.attributes
    end
    if @post.reply_id.nil?
      assert_redirected_to :controller => 'posts', :action => 'index'
    else
      assert_redirected_to :controller => 'posts', :action => 'display_all_replies', :id => @post.reply_id
    end
  end

  test "should show post" do
    get :show, id: @post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post.to_param
    assert_response :success
  end

  test "should update post" do
    put :update, id: @post.to_param, post: @post.attributes
    if @post.reply_id.nil?
      assert_redirected_to :controller => 'posts', :action => 'index'
    else
      assert_redirected_to :controller => 'posts', :action => 'display_all_replies', :id => @post.reply_id
    end
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post.to_param
    end

    assert_redirected_to :controller => "users", :action => "show_all_posts"
  end
end
