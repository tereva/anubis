require 'test_helper'

class LocationControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get location_destroy_url
    assert_response :success
  end

end
