require File.dirname(__FILE__) + '/../test_helper'

class FotosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:fotos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_foto
    assert_difference('Foto.count') do
      post :create, :foto => { }
    end

    assert_redirected_to foto_path(assigns(:foto))
  end

  def test_should_show_foto
    get :show, :id => fotos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => fotos(:one).id
    assert_response :success
  end

  def test_should_update_foto
    put :update, :id => fotos(:one).id, :foto => { }
    assert_redirected_to foto_path(assigns(:foto))
  end

  def test_should_destroy_foto
    assert_difference('Foto.count', -1) do
      delete :destroy, :id => fotos(:one).id
    end

    assert_redirected_to fotos_path
  end
end
