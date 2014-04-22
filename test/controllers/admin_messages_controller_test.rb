require 'test_helper'


class AdminMessagesControllerTest < ActionController::TestCase
  setup do
    @admin_message = admin_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  #test "should create admin message" do
  #  #removed for now, because there is no reason to test the post here, cause the projection creates it
  #  #maybe we could test something else here instead
  #end

  test "should show admin message" do
    get :show, id: @admin_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_message
    assert_response :success
  end

  #test "should update admin message" do
  #  #removed for now, because there is no reason to test the update here, cause the projection updates it
  #  #maybe we could test something else here instead
  #end

  #test "should destroy admin message" do
  #  #removed for now, because there is no reason to test the destroy here, cause the projection destroys it
  #  #maybe we could test something else here instead
  #end
end

