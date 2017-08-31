require 'rails_helper'

RSpec.describe "User can view all categories" do
  scenario "user views all categories" do
    category = Category.create(title: "Web Development")
    category_1 = Category.create(title: "HR")

    visit categories_path

    expect(page).to have_content("Web Development")
    expect(page).to have_content("HR")
  end
end
