require 'rails_helper'

RSpec.describe "user edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "HR")
    job = company.jobs.create(title: "developer", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)

    visit edit_company_job_path(company, job)
    fill_in "job[title]", with: "broadcaster"
    fill_in "job[description]", with: "not qualified"
    fill_in "job[city]", with: "Bristol"
    click_on "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("broadcaster")
    expect(page).to have_no_content("developer")
  end
end
