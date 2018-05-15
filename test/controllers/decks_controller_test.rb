require 'test_helper'

class DecksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get decks_index_url
    assert_response :success
  end

  test "should get new" do
    get decks_new_url
    assert_response :success
  end

end
