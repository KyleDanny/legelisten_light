require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "should not save person without title" do
    person = Person.new
    assert_not person.save
  end

  test "visiting the index" do
    visit people_url
    assert_selector "p", text: "resultater:"
  end

  test "should create person" do
    visit people_url
    click_on "+"

    fill_in "person[name]", with: @person.name
    fill_in "person[hprId]", with: @person.hprId

    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Tilbake"
  end

  test "should update Person" do
    visit person_url(@person)
    click_on "Redigere", match: :first

    fill_in "person[name]", with: @person.name
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Tilbake"
  end

  test "should destroy Person" do
    visit person_url(@person)
    click_on "Slette", match: :first

    assert_text "Person was successfully removed"
  end
end
