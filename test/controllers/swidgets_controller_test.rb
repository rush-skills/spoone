require 'test_helper'

class SwidgetsControllerTest < ActionController::TestCase
  setup do
    @swidget = swidgets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swidgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swidget" do
    assert_difference('Swidget.count') do
      post :create, swidget: { name: @swidget.name, widget_id: @swidget.widget_id }
    end

    assert_redirected_to swidget_path(assigns(:swidget))
  end

  test "should show swidget" do
    get :show, id: @swidget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swidget
    assert_response :success
  end

  test "should update swidget" do
    patch :update, id: @swidget, swidget: { name: @swidget.name, widget_id: @swidget.widget_id }
    assert_redirected_to swidget_path(assigns(:swidget))
  end

  test "should destroy swidget" do
    assert_difference('Swidget.count', -1) do
      delete :destroy, id: @swidget
    end

    assert_redirected_to swidgets_path
  end
end
