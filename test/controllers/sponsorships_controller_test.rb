require 'test_helper'

class SponsorshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sponsorships_index_url
    assert_response :success
  end

  test "should get new" do
    get sponsorships_new_url
    assert_response :success
  end

  test "should get create" do
    get sponsorships_create_url
    assert_response :success
  end

  test "should get edit" do
    get sponsorships_edit_url
    assert_response :success
  end

  test "should get update" do
    get sponsorships_update_url
    assert_response :success
  end

  test "should get destroy" do
    get sponsorships_destroy_url
    assert_response :success
  end

end
