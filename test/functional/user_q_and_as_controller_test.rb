require File.dirname(__FILE__) + '/../test_helper'

class UserQAndAsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:user_q_and_as)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_user_q_and_a
    assert_difference('UserQAndA.count') do
      post :create, :user_q_and_a => { }
    end

    assert_redirected_to user_q_and_a_path(assigns(:user_q_and_a))
  end

  def test_should_show_user_q_and_a
    get :show, :id => user_q_and_as(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => user_q_and_as(:one).id
    assert_response :success
  end

  def test_should_update_user_q_and_a
    put :update, :id => user_q_and_as(:one).id, :user_q_and_a => { }
    assert_redirected_to user_q_and_a_path(assigns(:user_q_and_a))
  end

  def test_should_destroy_user_q_and_a
    assert_difference('UserQAndA.count', -1) do
      delete :destroy, :id => user_q_and_as(:one).id
    end

    assert_redirected_to user_q_and_as_path
  end
end
