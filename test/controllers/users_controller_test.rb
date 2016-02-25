require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student user" do
    assert_difference('User.count') do
      post :create, user: { name: @user.name, email: 'newStudent_'+@user.email, type: @user.type, password: 'password', password_confirmation: 'password'}
    end
    assert_redirected_to welcome_index_path
  end
  test "should create admin user" do
    assert_difference('User.count') do

      post :create, user: { name: users(:two).name, email: 'newAdmin_'+users(:two).email, type: users(:two).type, password: 'password', password_confirmation: 'password'}
    end
    assert_redirected_to welcome_index_path
  end
  test "should create instructor user" do
    assert_difference('User.count') do
      post :create, user: { name: users(:three).name, email: 'newInstructor_'+users(:three).email, type: users(:three).type, password: 'password', password_confirmation: 'password'}
    end
    assert_redirected_to welcome_index_path
  end

  test "create user blank email should fail" do
    assert_no_difference('User.count') do
      post :create, user: { name: @user.name, email: '', type: @user.type, password: 'password', password_confirmation: 'password'}
    end
    assert_response 200 #would actually expect this to give an error status of some sort?
  end

  test "create user duplicate email should fail" do
    assert_no_difference('User.count') do
      post :create, user: { name: @user.name, email: @user.email, type: @user.type, password: 'password', password_confirmation: 'password'}
    end
    assert_response 200 #would actually expect this to give an error status of some sort?
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user,  user:{ name: 'newusername', email: 'newuser@email.com', type: @user.type, password: 'password', password_confirmation: 'password'}
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
