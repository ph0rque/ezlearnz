require File.dirname(__FILE__) + '/../test_helper'

class UserUnitsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:user_units)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_user_unit
    assert_difference('UserUnit.count') do
      post :create, :user_unit => { }
    end

    assert_redirected_to user_unit_path(assigns(:user_unit))
  end

  def test_should_show_user_unit
    get :show, :id => user_units(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => user_units(:one).id
    assert_response :success
  end

  def test_should_update_user_unit
    put :update, :id => user_units(:one).id, :user_unit => { }
    assert_redirected_to user_unit_path(assigns(:user_unit))
  end

  def test_should_destroy_user_unit
    assert_difference('UserUnit.count', -1) do
      delete :destroy, :id => user_units(:one).id
    end

    assert_redirected_to user_units_path
  end
end
