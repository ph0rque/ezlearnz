require File.dirname(__FILE__) + '/../test_helper'

class UserPartsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:user_parts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_user_part
    assert_difference('UserPart.count') do
      post :create, :user_part => { }
    end

    assert_redirected_to user_part_path(assigns(:user_part))
  end

  def test_should_show_user_part
    get :show, :id => user_parts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => user_parts(:one).id
    assert_response :success
  end

  def test_should_update_user_part
    put :update, :id => user_parts(:one).id, :user_part => { }
    assert_redirected_to user_part_path(assigns(:user_part))
  end

  def test_should_destroy_user_part
    assert_difference('UserPart.count', -1) do
      delete :destroy, :id => user_parts(:one).id
    end

    assert_redirected_to user_parts_path
  end
end
