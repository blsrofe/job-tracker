require "rails_helper"

RSpec.describe "user can edit categories from the index page" do
  scenario "user edits categories from the index page" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Web Development")
    job = company.jobs.create(title: "developer", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)
    job_1 = company.jobs.create(title: "broadcaster", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)

    visit categories_path
    click_on "Edit"

    expect(current_path).to eq(edit_category_path(category))
    fill_in "Title", with: "HR"
    click_on "Update Category"
    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("HR")
    expect(page).to have_no_content("Web Development")
  end
end
