require 'test_helper'

class ThumbometersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thumbometers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thumbometer" do
    assert_difference('Thumbometer.count') do
      post :create, :thumbometer => { }
    end

    assert_redirected_to thumbometer_path(assigns(:thumbometer))
  end

  test "should show thumbometer" do
    get :show, :id => thumbometers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => thumbometers(:one).to_param
    assert_response :success
  end

  test "should update thumbometer" do
    put :update, :id => thumbometers(:one).to_param, :thumbometer => { }
    assert_redirected_to thumbometer_path(assigns(:thumbometer))
  end

  test "should destroy thumbometer" do
    assert_difference('Thumbometer.count', -1) do
      delete :destroy, :id => thumbometers(:one).to_param
    end

    assert_redirected_to thumbometers_path
  end
end
