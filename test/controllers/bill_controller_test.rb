require "test_helper"

class BillControllerTest < ActionDispatch::IntegrationTest
  test "should get bill" do
    get bill_bill_url
    assert_response :success
  end
end
