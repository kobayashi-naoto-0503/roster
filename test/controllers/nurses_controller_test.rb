require 'test_helper'

class NursesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get nurses_new_url
    assert_response :success
  end

end
