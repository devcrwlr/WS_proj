require 'test_helper'

class KaraokesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @karaoke = karaokes(:one)
  end

  test "should get index" do
    get karaokes_url
    assert_response :success
  end

  test "should get new" do
    get new_karaoke_url
    assert_response :success
  end

  test "should create karaoke" do
    assert_difference('Karaoke.count') do
      post karaokes_url, params: { karaoke: {  } }
    end

    assert_redirected_to karaoke_url(Karaoke.last)
  end

  test "should show karaoke" do
    get karaoke_url(@karaoke)
    assert_response :success
  end

  test "should get edit" do
    get edit_karaoke_url(@karaoke)
    assert_response :success
  end

  test "should update karaoke" do
    patch karaoke_url(@karaoke), params: { karaoke: {  } }
    assert_redirected_to karaoke_url(@karaoke)
  end

  test "should destroy karaoke" do
    assert_difference('Karaoke.count', -1) do
      delete karaoke_url(@karaoke)
    end

    assert_redirected_to karaokes_url
  end
end
