require 'test_helper'

class AdsensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adsense = adsenses(:one)
  end

  test "should get index" do
    get adsenses_url
    assert_response :success
  end

  test "should get new" do
    get new_adsense_url
    assert_response :success
  end

  test "should create adsense" do
    assert_difference('Adsense.count') do
      post adsenses_url, params: { adsense: { description: @adsense.description, price: @adsense.price, title: @adsense.title } }
    end

    assert_redirected_to adsense_url(Adsense.last)
  end

  test "should show adsense" do
    get adsense_url(@adsense)
    assert_response :success
  end

  test "should get edit" do
    get edit_adsense_url(@adsense)
    assert_response :success
  end

  test "should update adsense" do
    patch adsense_url(@adsense), params: { adsense: { description: @adsense.description, price: @adsense.price, title: @adsense.title } }
    assert_redirected_to adsense_url(@adsense)
  end

  test "should destroy adsense" do
    assert_difference('Adsense.count', -1) do
      delete adsense_url(@adsense)
    end

    assert_redirected_to adsenses_url
  end
end
