require 'rails_helper'

RSpec.describe "user can delete a job" do
  scenario "user deletes a job" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "HR")
    job = company.jobs.create(title: "developer", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)
    job_1 = company.jobs.create(title: "broadcaster", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)

    visit company_job_path(company, job)
    click_on "Delete"

  #  expect(current_path).to eq(company_jobs_path)
    expect(page).to have_content("broadcaster")
    expect(page).to have_no_content("developer")
  end
end
