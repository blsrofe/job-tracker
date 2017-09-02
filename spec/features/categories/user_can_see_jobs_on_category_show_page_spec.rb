require 'rails_helper'

RSpec.describe "user visits show page for a specific category" do
  scenario "they see a list of jobs in that category" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "HR")
    job = company.jobs.create(title: "developer", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)
    job_1 = company.jobs.create(title: "broadcaster", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)

    visit category_path(category)
    expect(page).to have_content("ESPN-developer")
    expect(page).to have_content("ESPN-broadcaster")
  end
end
