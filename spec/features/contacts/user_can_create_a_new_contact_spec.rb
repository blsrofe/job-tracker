require 'rails_helper'

RSpec.describe "user visits a company show page" do
  scenario "user creates a new contact" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Web Development")
    job = company.jobs.create(title: "developer", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)

  visit company_path(company)
  click_on "Add Contact"

  expect(current_path).to eq(new_company_contact_path(company))
  fill_in "Name", with: "Person"
  fill_in "Position", with: "Boss"
  fill_in "Email", with: "boss@company.com"
  click_on "Create Contact"

  expect(current_path).to eq(company_jobs_path(company))
  expect(page).to have_content("Person")
  expect(page).to have_content("Boss")
  expect(page).to have_content("boss@company.com")
  end
end
