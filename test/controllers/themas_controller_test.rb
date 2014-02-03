require 'test_helper'


class ThemasControllerTest < ActionController::TestCase
  setup do
    @thema = themas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:themas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  #test "should create thema" do
  #  #removed for now, because there is no reason to test the post here, cause the projection creates it
  #  #maybe we could test something else here instead
  #end

  test "should show thema" do
    get :show, id: @thema
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thema
    assert_response :success
  end

  #test "should update thema" do
  #  #removed for now, because there is no reason to test the update here, cause the projection updates it
  #  #maybe we could test something else here instead
  #end

  #test "should destroy thema" do
  #  #removed for now, because there is no reason to test the destroy here, cause the projection destroys it
  #  #maybe we could test something else here instead
  #end
end

