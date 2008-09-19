require File.dirname(__FILE__) + '/../test_helper'

class QAndAsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:q_and_as)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_q_and_a
    assert_difference('QAndA.count') do
      post :create, :q_and_a => { }
    end

    assert_redirected_to q_and_a_path(assigns(:q_and_a))
  end

  def test_should_show_q_and_a
    get :show, :id => q_and_as(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => q_and_as(:one).id
    assert_response :success
  end

  def test_should_update_q_and_a
    put :update, :id => q_and_as(:one).id, :q_and_a => { }
    assert_redirected_to q_and_a_path(assigns(:q_and_a))
  end

  def test_should_destroy_q_and_a
    assert_difference('QAndA.count', -1) do
      delete :destroy, :id => q_and_as(:one).id
    end

    assert_redirected_to q_and_as_path
  end
end
