require 'rails_helper'

RSpec.describe "user visits a job show page" do
  scenario "creates a new comment for that job" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Web Development")
    job = company.jobs.create(title: "developer", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)

    visit job_path(job)

    click_on "New Comment"

    expect(current_path).to eq(new_job_comment_path(job))
    fill_in "Content", with: "talked with someone"
    click_on "Create Comment"

    expect(current_path).to eq(job_path(job))
    expect(page).to have_content("talked with someone")

  end
end
