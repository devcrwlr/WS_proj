require 'test_helper'

class Mp4sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mp4 = mp4s(:one)
  end

  test "should get index" do
    get mp4s_url
    assert_response :success
  end

  test "should get new" do
    get new_mp4_url
    assert_response :success
  end

  test "should create mp4" do
    assert_difference('Mp4.count') do
      post mp4s_url, params: { mp4: {  } }
    end

    assert_redirected_to mp4_url(Mp4.last)
  end

  test "should show mp4" do
    get mp4_url(@mp4)
    assert_response :success
  end

  test "should get edit" do
    get edit_mp4_url(@mp4)
    assert_response :success
  end

  test "should update mp4" do
    patch mp4_url(@mp4), params: { mp4: {  } }
    assert_redirected_to mp4_url(@mp4)
  end

  test "should destroy mp4" do
    assert_difference('Mp4.count', -1) do
      delete mp4_url(@mp4)
    end

    assert_redirected_to mp4s_url
  end
end
