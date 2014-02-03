require 'test_helper'


class AdminmessagesControllerTest < ActionController::TestCase
  setup do
    @adminmessage = adminmessages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adminmessages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  #test "should create adminmessage" do
  #  #removed for now, because there is no reason to test the post here, cause the projection creates it
  #  #maybe we could test something else here instead
  #end

  test "should show adminmessage" do
    get :show, id: @adminmessage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adminmessage
    assert_response :success
  end

  #test "should update adminmessage" do
  #  #removed for now, because there is no reason to test the update here, cause the projection updates it
  #  #maybe we could test something else here instead
  #end

  #test "should destroy adminmessage" do
  #  #removed for now, because there is no reason to test the destroy here, cause the projection destroys it
  #  #maybe we could test something else here instead
  #end
end

