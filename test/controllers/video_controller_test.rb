require 'test_helper'

class VideoControllerTest < ActionDispatch::IntegrationTest
  test "should get save" do
    get video_save_url
    assert_response :success
  end

end
