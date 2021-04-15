require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin = User.create(username: 'admin', email: 'admin@localhost.com',
      password: "password", admin: true)
  end

  test "get new category form and create category" do
    sign_in_as(@admin)
    get new_category_path
    assert_response :success
    assert_difference "Category.count", 1 do
      post categories_path, params: { category: { name: "Sports"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end

  test "get new category form and reject invalid category submission" do
    sign_in_as(@admin)
    get new_category_path
    assert_response :success
    assert_no_difference "Category.count" do
      post categories_path, params: { category: { name: " "} }
    end
    assert_response :unprocessable_entity
    assert_select "#error_explanation"
    assert_match "Name can&#39;t be blank", response.body
  end
end
