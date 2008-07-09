require 'test_helper'

class SpacesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:spaces)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_space
    assert_difference('Space.count') do
      post :create, :space => { }
    end

    assert_redirected_to space_path(assigns(:space))
  end

  def test_should_show_space
    get :show, :id => spaces(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => spaces(:one).id
    assert_response :success
  end

  def test_should_update_space
    put :update, :id => spaces(:one).id, :space => { }
    assert_redirected_to space_path(assigns(:space))
  end

  def test_should_destroy_space
    assert_difference('Space.count', -1) do
      delete :destroy, :id => spaces(:one).id
    end

    assert_redirected_to spaces_path
  end
end
