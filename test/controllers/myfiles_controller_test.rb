require 'test_helper'

class MyfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myfile = myfiles(:one)
  end

  test "should get index" do
    get myfiles_url
    assert_response :success
  end

  test "should get new" do
    get new_myfile_url
    assert_response :success
  end

  test "should create myfile" do
    assert_difference('Myfile.count') do
      post myfiles_url, params: { myfile: { filename: @myfile.filename, song_id: @myfile.song_id } }
    end

    assert_redirected_to myfile_url(Myfile.last)
  end

  test "should show myfile" do
    get myfile_url(@myfile)
    assert_response :success
  end

  test "should get edit" do
    get edit_myfile_url(@myfile)
    assert_response :success
  end

  test "should update myfile" do
    patch myfile_url(@myfile), params: { myfile: { filename: @myfile.filename, song_id: @myfile.song_id } }
    assert_redirected_to myfile_url(@myfile)
  end

  test "should destroy myfile" do
    assert_difference('Myfile.count', -1) do
      delete myfile_url(@myfile)
    end

    assert_redirected_to myfiles_url
  end
end
