require 'rails_helper'

RSpec.describe "User can create a new category" do
  scenario "user create new category" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "HR")
    job = company.jobs.create(title: "developer", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)
    job_1 = company.jobs.create(title: "broadcaster", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)

    visit categories_path

    click_on "Create new category"
    fill_in "Title", with: "Web Development"
    click_on "Create Category"

    expect(page).to have_content("Web Development")
  end
end
