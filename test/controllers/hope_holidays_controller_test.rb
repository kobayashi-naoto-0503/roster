require 'test_helper'

class HopeHolidaysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hope_holidays_new_url
    assert_response :success
  end

end
