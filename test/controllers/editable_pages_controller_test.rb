require 'test_helper'

class EditablePagesControllerTest < ActionController::TestCase
  setup do
    @editable_page = editable_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editable_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create editable_page" do
    assert_difference('EditablePage.count') do
      post :create, editable_page: {  }
    end

    assert_redirected_to editable_page_path(assigns(:editable_page))
  end

  test "should show editable_page" do
    get :show, id: @editable_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @editable_page
    assert_response :success
  end

  test "should update editable_page" do
    patch :update, id: @editable_page, editable_page: {  }
    assert_redirected_to editable_page_path(assigns(:editable_page))
  end

  test "should destroy editable_page" do
    assert_difference('EditablePage.count', -1) do
      delete :destroy, id: @editable_page
    end

    assert_redirected_to editable_pages_path
  end
end
