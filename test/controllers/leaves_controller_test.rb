require 'test_helper'

class LeavesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get leaves_new_url
    assert_response :success
  end

end
