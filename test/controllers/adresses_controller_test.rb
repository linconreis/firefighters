require 'test_helper'

class AdressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adresses_index_url
    assert_response :success
  end

end
