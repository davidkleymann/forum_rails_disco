require 'test_helper'


class TopicsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  #test "should create topic" do
  #  #removed for now, because there is no reason to test the post here, cause the projection creates it
  #  #maybe we could test something else here instead
  #end

  test "should show topic" do
    get :show, id: @topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @topic
    assert_response :success
  end

  #test "should update topic" do
  #  #removed for now, because there is no reason to test the update here, cause the projection updates it
  #  #maybe we could test something else here instead
  #end

  #test "should destroy topic" do
  #  #removed for now, because there is no reason to test the destroy here, cause the projection destroys it
  #  #maybe we could test something else here instead
  #end
end

