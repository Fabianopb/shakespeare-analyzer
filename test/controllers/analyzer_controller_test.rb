require 'test_helper'

class AnalyzerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get analyzer_index_url
    assert_response :success
  end

end
