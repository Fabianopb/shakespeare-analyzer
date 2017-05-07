require 'test_helper'

class AnalyzerControllerTest < ActionDispatch::IntegrationTest

  test 'should get index url' do
    get analyzer_index_url
    assert_response :success
  end

  test 'should post results url' do
    post analyzer_results_url
    assert_response :success
  end

  test 'should get results_data url' do
    get analyzer_results_data_url
    assert_response :success
  end

end
