require 'test_helper'

class EditalsControllerTest < ActionController::TestCase
  setup do
    @edital = editals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create edital" do
    assert_difference('Edital.count') do
      post :create, edital: {  }
    end

    assert_redirected_to edital_path(assigns(:edital))
  end

  test "should show edital" do
    get :show, id: @edital
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @edital
    assert_response :success
  end

  test "should update edital" do
    patch :update, id: @edital, edital: {  }
    assert_redirected_to edital_path(assigns(:edital))
  end

  test "should destroy edital" do
    assert_difference('Edital.count', -1) do
      delete :destroy, id: @edital
    end

    assert_redirected_to editals_path
  end
end
