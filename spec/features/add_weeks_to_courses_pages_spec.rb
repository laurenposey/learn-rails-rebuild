require 'rails_helper'

describe "the add a week process" do
  it "adds a new week to a course" do
    visit courses_path
    click_link 'Add a Course'
    fill_in 'Title', :with => 'Sample Title'
    fill_in 'Teacher', :with => 'Sample Teacher'
    click_on 'Create Course'
    expect(page).to have_content "Course saved successfully!"
  end
end
