require 'test_helper'

class EditPermissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edit_permission = edit_permissions(:one)
  end

  test "should get index" do
    get edit_permissions_url
    assert_response :success
  end

  test "should get new" do
    get new_edit_permission_url
    assert_response :success
  end

  test "should create edit_permission" do
    assert_difference('EditPermission.count') do
      post edit_permissions_url, params: { edit_permission: { document_id: @edit_permission.document_id, user_id: @edit_permission.user_id } }
    end

    assert_redirected_to edit_permission_url(EditPermission.last)
  end

  test "should show edit_permission" do
    get edit_permission_url(@edit_permission)
    assert_response :success
  end

  test "should get edit" do
    get edit_edit_permission_url(@edit_permission)
    assert_response :success
  end

  test "should update edit_permission" do
    patch edit_permission_url(@edit_permission), params: { edit_permission: { document_id: @edit_permission.document_id, user_id: @edit_permission.user_id } }
    assert_redirected_to edit_permission_url(@edit_permission)
  end

  test "should destroy edit_permission" do
    assert_difference('EditPermission.count', -1) do
      delete edit_permission_url(@edit_permission)
    end

    assert_redirected_to edit_permissions_url
  end
end
