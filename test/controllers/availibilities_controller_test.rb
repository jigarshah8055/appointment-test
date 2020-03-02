require 'test_helper'

class AvailibilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get availibilities_new_url
    assert_response :success
  end

  test "should get edit" do
    get availibilities_edit_url
    assert_response :success
  end

end
