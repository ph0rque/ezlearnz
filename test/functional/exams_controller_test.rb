require File.dirname(__FILE__) + '/../test_helper'

class ExamsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:exams)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_exam
    assert_difference('Exam.count') do
      post :create, :exam => { }
    end

    assert_redirected_to exam_path(assigns(:exam))
  end

  def test_should_show_exam
    get :show, :id => exams(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => exams(:one).id
    assert_response :success
  end

  def test_should_update_exam
    put :update, :id => exams(:one).id, :exam => { }
    assert_redirected_to exam_path(assigns(:exam))
  end

  def test_should_destroy_exam
    assert_difference('Exam.count', -1) do
      delete :destroy, :id => exams(:one).id
    end

    assert_redirected_to exams_path
  end
end
