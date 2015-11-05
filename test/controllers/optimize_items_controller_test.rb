require 'test_helper'

class OptimizeItemsControllerTest < ActionController::TestCase
  setup do
    @optimize_item = optimize_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:optimize_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create optimize_item" do
    assert_difference('OptimizeItem.count') do
      post :create, optimize_item: { content: @optimize_item.content, from: @optimize_item.from, in_charge: @optimize_item.in_charge, status: @optimize_item.status }
    end

    assert_redirected_to optimize_item_path(assigns(:optimize_item))
  end

  test "should show optimize_item" do
    get :show, id: @optimize_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @optimize_item
    assert_response :success
  end

  test "should update optimize_item" do
    patch :update, id: @optimize_item, optimize_item: { content: @optimize_item.content, from: @optimize_item.from, in_charge: @optimize_item.in_charge, status: @optimize_item.status }
    assert_redirected_to optimize_item_path(assigns(:optimize_item))
  end

  test "should destroy optimize_item" do
    assert_difference('OptimizeItem.count', -1) do
      delete :destroy, id: @optimize_item
    end

    assert_redirected_to optimize_items_path
  end
end
