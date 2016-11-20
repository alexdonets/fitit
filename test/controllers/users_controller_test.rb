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

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { activity_level: @user.activity_level, age: @user.age, calorie_goal: @user.calorie_goal, carb_goal: @user.carb_goal, fat_goal: @user.fat_goal, fiber_goal: @user.fiber_goal, goal: @user.goal, height: @user.height, password: @user.password, protein_goal: @user.protein_goal, sugar_goal: @user.sugar_goal, username: @user.username, weight: @user.weight }
    end

    assert_redirected_to user_path(assigns(:user))
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
    patch :update, id: @user, user: { activity_level: @user.activity_level, age: @user.age, calorie_goal: @user.calorie_goal, carb_goal: @user.carb_goal, fat_goal: @user.fat_goal, fiber_goal: @user.fiber_goal, goal: @user.goal, height: @user.height, password: @user.password, protein_goal: @user.protein_goal, sugar_goal: @user.sugar_goal, username: @user.username, weight: @user.weight }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
