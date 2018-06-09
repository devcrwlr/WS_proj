require 'test_helper'

class Mp3sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mp3 = mp3s(:one)
  end

  test "should get index" do
    get mp3s_url
    assert_response :success
  end

  test "should get new" do
    get new_mp3_url
    assert_response :success
  end

  test "should create mp3" do
    assert_difference('Mp3.count') do
      post mp3s_url, params: { mp3: {  } }
    end

    assert_redirected_to mp3_url(Mp3.last)
  end

  test "should show mp3" do
    get mp3_url(@mp3)
    assert_response :success
  end

  test "should get edit" do
    get edit_mp3_url(@mp3)
    assert_response :success
  end

  test "should update mp3" do
    patch mp3_url(@mp3), params: { mp3: {  } }
    assert_redirected_to mp3_url(@mp3)
  end

  test "should destroy mp3" do
    assert_difference('Mp3.count', -1) do
      delete mp3_url(@mp3)
    end

    assert_redirected_to mp3s_url
  end
end
