require "test_helper"

class LessonPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_payment = lesson_payments(:one)
  end

  test "should get index" do
    get lesson_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_payment_url
    assert_response :success
  end

  test "should create lesson_payment" do
    assert_difference('LessonPayment.count') do
      post lesson_payments_url, params: { lesson_payment: { account_id: @lesson_payment.account_id, booking_id: @lesson_payment.booking_id, cost: @lesson_payment.cost, date: @lesson_payment.date, payment_number: @lesson_payment.payment_number, service: @lesson_payment.service, status: @lesson_payment.status } }
    end

    assert_redirected_to lesson_payment_url(LessonPayment.last)
  end

  test "should show lesson_payment" do
    get lesson_payment_url(@lesson_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_payment_url(@lesson_payment)
    assert_response :success
  end

  test "should update lesson_payment" do
    patch lesson_payment_url(@lesson_payment), params: { lesson_payment: { account_id: @lesson_payment.account_id, booking_id: @lesson_payment.booking_id, cost: @lesson_payment.cost, date: @lesson_payment.date, payment_number: @lesson_payment.payment_number, service: @lesson_payment.service, status: @lesson_payment.status } }
    assert_redirected_to lesson_payment_url(@lesson_payment)
  end

  test "should destroy lesson_payment" do
    assert_difference('LessonPayment.count', -1) do
      delete lesson_payment_url(@lesson_payment)
    end

    assert_redirected_to lesson_payments_url
  end
end
