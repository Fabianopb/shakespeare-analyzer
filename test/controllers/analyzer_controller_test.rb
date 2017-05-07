require 'test_helper'

class AnalyzerControllerTest < ActionDispatch::IntegrationTest

  i_suck_and_my_tests_are_order_dependent!

  test 'should get index url' do
    get analyzer_index_url
    assert_response :success
  end

  test 'should redirect post results if url is invalid' do
    post analyzer_results_url, params: { play: 'http://www.invalid.xml' }
    assert_response :redirect
  end

  test 'should redirect post results if url is empty' do
    post analyzer_results_url, params: { play: '' }
    assert_response :redirect
  end

  test 'should post results url with valid url' do
    post analyzer_results_url, params: { play: 'http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml' }
    assert_response :success
  end

end
