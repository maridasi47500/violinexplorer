require 'test_helper'

class AudioControllerTest < ActionDispatch::IntegrationTest
  test "should get save" do
    get audio_save_url
    assert_response :success
  end

end
