require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup infomation" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
      post signup_path, params: { user: {name: "",
                                email: "user@invalid",
                                password: "foo",
                                password_confirmation: "bar"}
                              }
    end

    assert_template 'users/new'
    assert_select "div#error_explanation"
  end

  test "valid signup infomation" do
    get signup_path
    assert_difference 'User.count', 1 do
      post signup_path, params: { 
        user: {
          name: "Example",
          email: "user@example.com",
          password: "123456",
          password: "123456"
        }
      }
    end

    follow_redirect!
    assert_template 'users/show'

    assert_not flash.empty?
    assert_select 'div.alert.alert-success'
  end
end
