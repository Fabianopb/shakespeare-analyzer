require 'test_helper'

class AnalyzerControllerTest < ActionDispatch::IntegrationTest

  test "should get index url" do
    get analyzer_index_url
    assert_response :success
  end

  test "should post results url" do
    post analyzer_results_url
    assert_response :success
  end

end
