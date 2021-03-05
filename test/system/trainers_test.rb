require "application_system_test_case"

class TrainersTest < ApplicationSystemTestCase
  setup do
    @trainer = trainers(:one)
  end

  test "visiting the index" do
    visit trainers_url
    assert_selector "h1", text: "Trainers"
  end

  test "creating a Trainer" do
    visit trainers_url
    click_on "New Trainer"

    fill_in "Account", with: @trainer.account_id
    fill_in "Bio", with: @trainer.bio
    fill_in "Experience", with: @trainer.experience
    fill_in "First name", with: @trainer.first_name
    fill_in "Last name", with: @trainer.last_name
    fill_in "Phone", with: @trainer.phone
    fill_in "Photo", with: @trainer.photo
    fill_in "User", with: @trainer.user_id
    click_on "Create Trainer"

    assert_text "Trainer was successfully created"
    click_on "Back"
  end

  test "updating a Trainer" do
    visit trainers_url
    click_on "Edit", match: :first

    fill_in "Account", with: @trainer.account_id
    fill_in "Bio", with: @trainer.bio
    fill_in "Experience", with: @trainer.experience
    fill_in "First name", with: @trainer.first_name
    fill_in "Last name", with: @trainer.last_name
    fill_in "Phone", with: @trainer.phone
    fill_in "Photo", with: @trainer.photo
    fill_in "User", with: @trainer.user_id
    click_on "Update Trainer"

    assert_text "Trainer was successfully updated"
    click_on "Back"
  end

  test "destroying a Trainer" do
    visit trainers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trainer was successfully destroyed"
  end
end
