require "test_helper"

class WikipediaSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wikipedia_search_index_url
    assert_response :success
  end
end
