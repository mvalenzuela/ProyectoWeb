require 'test_helper'

class CategoriesDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categories_document = categories_documents(:one)
  end

  test "should get index" do
    get categories_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_categories_document_url
    assert_response :success
  end

  test "should create categories_document" do
    assert_difference('CategoriesDocument.count') do
      post categories_documents_url, params: { categories_document: { category_id: @categories_document.category_id, document_id: @categories_document.document_id } }
    end

    assert_redirected_to categories_document_url(CategoriesDocument.last)
  end

  test "should show categories_document" do
    get categories_document_url(@categories_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_categories_document_url(@categories_document)
    assert_response :success
  end

  test "should update categories_document" do
    patch categories_document_url(@categories_document), params: { categories_document: { category_id: @categories_document.category_id, document_id: @categories_document.document_id } }
    assert_redirected_to categories_document_url(@categories_document)
  end

  test "should destroy categories_document" do
    assert_difference('CategoriesDocument.count', -1) do
      delete categories_document_url(@categories_document)
    end

    assert_redirected_to categories_documents_url
  end
end
