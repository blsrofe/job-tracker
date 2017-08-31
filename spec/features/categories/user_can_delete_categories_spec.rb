require "rails_helper"

RSpec.describe "User can delete a category from the index page" do
  scenario "user deletes a category from the index page" do
    category = Category.create(title: "Web Development")
    category_1 = Category.create(title: "HR")

    visit categories_path
    page.first(:link, "Delete").click

    expect(page).to have_content("HR")
    expect(page).to have_no_content("Web Development")
  end
end
