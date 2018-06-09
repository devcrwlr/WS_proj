require 'test_helper'

class LyricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lyric = lyrics(:one)
  end

  test "should get index" do
    get lyrics_url
    assert_response :success
  end

  test "should get new" do
    get new_lyric_url
    assert_response :success
  end

  test "should create lyric" do
    assert_difference('Lyric.count') do
      post lyrics_url, params: { lyric: {  } }
    end

    assert_redirected_to lyric_url(Lyric.last)
  end

  test "should show lyric" do
    get lyric_url(@lyric)
    assert_response :success
  end

  test "should get edit" do
    get edit_lyric_url(@lyric)
    assert_response :success
  end

  test "should update lyric" do
    patch lyric_url(@lyric), params: { lyric: {  } }
    assert_redirected_to lyric_url(@lyric)
  end

  test "should destroy lyric" do
    assert_difference('Lyric.count', -1) do
      delete lyric_url(@lyric)
    end

    assert_redirected_to lyrics_url
  end
end
