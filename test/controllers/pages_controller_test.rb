require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get pages_admin_url
    assert_response :success
  end

  test "should get show" do
    get pages_show_url
    assert_response :success
  end

end
