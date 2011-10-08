require 'test_helper'
require 'capybara/rails'

class IntegrationTest < ActionController::TestCase
  include Capybara::DSL

  test "viewing home page" do
    visit '/'
    #assert page.has_selector?("title#Live Question App")
    assert page.has_content? ('Home')
    assert page.has_content?('Sign Up!')
    assert page.has_content? ('login')
  end

  test "viewing posts" do
    visit '/'
    assert page.has_content?('Recent Posts')
  end

  test "Sign up" do
    visit '/'
        click_link('Sign Up!')
        assert page.has_content? ('Username')
        fill_in 'Username', :with => "dasesd"
        fill_in 'Password', :with => "123456"
        fill_in 'First Name', :with => "ngpaul"
        fill_in 'Last Name', :with => "siddesh"
        fill_in 'Email', :with => "ngpaul@ncsu.edu"
        click_on('Sign Up')
        assert page.has_content?('Login')
  end

  test "login" do
    visit '/users/login'
    assert page.has_content?('Username')
    fill_in 'user_user_name', :with => "dasesd"
    fill_in 'user_password', :with => "123456"
    click_on('Sign In')
    assert page.has_content?('Login')
    #click_on "Home"
    #click_on "New Post"

  end

  test "view Recent Posts" do
    visit '/'
    assert page.has_content?('Recent Posts')
    #click_on("New Post")
  end

end