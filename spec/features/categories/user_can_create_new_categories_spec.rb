require 'rails_helper'

RSpec.describe "User can create a new category" do
  scenario "user create new category" do
    visit categories_path

    click_on "Create new category"
    fill_in "Title", with: "Web Development"
    click_on "Create Category"

    expect(page).to have_content("Web Development")
  end
end
