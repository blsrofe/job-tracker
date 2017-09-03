require 'rails_helper'

RSpec.describe "user visits dashboard" do
  scenario "and sees analytics information" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Web Development")
    job = company.jobs.create(title: "developer", description: "super fun", level_of_interest: 90,
                              city: "New York", category: category)
    job_1 = company.jobs.create(title: "broadcaster", description: "super fun", level_of_interest: 50,
                              city: "New York", category: category)

    visit '/dashboard'

    within(:css, "li#ninety") do
      expect(page).to have_content("Web Development")
      expect(page).to have_no_content("broadcaster")
    end
  end
end
