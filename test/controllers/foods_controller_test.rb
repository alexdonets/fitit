require 'test_helper'

class FoodsControllerTest < ActionController::TestCase
  setup do
    @food = Food.new(name: "some name", portion: "100g", calories: 500, carb: 20, protein: 20, fat: 50, fiber: 5, sugar: 5, added_by: 50)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food" do
    assert_difference('Food.count') do
      post :create, food: { added_by: @food.added_by, calories: @food.calories, carb: @food.carb, category: @food.category, fat: @food.fat, fiber: @food.fiber, name: @food.name, portion: @food.portion, protein: @food.protein, sugar: @food.sugar }
    end

    assert_redirected_to food_path(assigns(:food))
  end

  test "should show food" do
    get :show, id: @food
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food
    assert_response :success
  end

  test "should update food" do
    patch :update, id: @food, food: { added_by: @food.added_by, calories: @food.calories, carb: @food.carb, category: @food.category, fat: @food.fat, fiber: @food.fiber, name: @food.name, portion: @food.portion, protein: @food.protein, sugar: @food.sugar }
    assert_redirected_to food_path(assigns(:food))
  end

  test "should destroy food" do
    assert_difference('Food.count', -1) do
      delete :destroy, id: @food
    end

    assert_redirected_to foods_path
  end
end
