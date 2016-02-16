require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get view_course" do
    get :view_course
    assert_response :success
  end

  test "should get view_mine" do
    get :view_mine
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
