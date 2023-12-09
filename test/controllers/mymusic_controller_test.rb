require 'test_helper'

class MymusicControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get mymusic_hello_url
    assert_response :success
  end

end
