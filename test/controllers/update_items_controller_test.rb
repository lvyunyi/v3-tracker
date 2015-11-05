require 'test_helper'

class UpdateItemsControllerTest < ActionController::TestCase
  setup do
    @update_item = update_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:update_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create update_item" do
    assert_difference('UpdateItem.count') do
      post :create, update_item: { content: @update_item.content, from: @update_item.from }
    end

    assert_redirected_to update_item_path(assigns(:update_item))
  end

  test "should show update_item" do
    get :show, id: @update_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @update_item
    assert_response :success
  end

  test "should update update_item" do
    patch :update, id: @update_item, update_item: { content: @update_item.content, from: @update_item.from }
    assert_redirected_to update_item_path(assigns(:update_item))
  end

  test "should destroy update_item" do
    assert_difference('UpdateItem.count', -1) do
      delete :destroy, id: @update_item
    end

    assert_redirected_to update_items_path
  end
end
