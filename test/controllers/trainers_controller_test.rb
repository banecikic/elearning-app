require "test_helper"

class TrainersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trainer = trainers(:one)
  end

  test "should get index" do
    get trainers_url
    assert_response :success
  end

  test "should get new" do
    get new_trainer_url
    assert_response :success
  end

  test "should create trainer" do
    assert_difference('Trainer.count') do
      post trainers_url, params: { trainer: { account_id: @trainer.account_id, bio: @trainer.bio, experience: @trainer.experience, first_name: @trainer.first_name, last_name: @trainer.last_name, phone: @trainer.phone, photo: @trainer.photo, user_id: @trainer.user_id } }
    end

    assert_redirected_to trainer_url(Trainer.last)
  end

  test "should show trainer" do
    get trainer_url(@trainer)
    assert_response :success
  end

  test "should get edit" do
    get edit_trainer_url(@trainer)
    assert_response :success
  end

  test "should update trainer" do
    patch trainer_url(@trainer), params: { trainer: { account_id: @trainer.account_id, bio: @trainer.bio, experience: @trainer.experience, first_name: @trainer.first_name, last_name: @trainer.last_name, phone: @trainer.phone, photo: @trainer.photo, user_id: @trainer.user_id } }
    assert_redirected_to trainer_url(@trainer)
  end

  test "should destroy trainer" do
    assert_difference('Trainer.count', -1) do
      delete trainer_url(@trainer)
    end

    assert_redirected_to trainers_url
  end
end
