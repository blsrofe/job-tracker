require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        category = Category.create(title: "HR")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
    it "belongs to a category" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:category)
    end
    it "has many comments" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:comments)
    end
  end

  describe "class methods" do
    it "can order by level of interest" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: "HR")
      company.jobs.create!(title: "Developer", level_of_interest: 60, city: "Denver", category: category)
      company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)
      company.jobs.create!(title: "Senior VP", level_of_interest: 60, city: "Denver", category: category)

      expect(Job.level_of_interest).to eq({60 => 2, 70 => 1})
      # Job.level_of_interest.should == {60 => 2, 70 => 1}
    end
    it "can sort by location" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: "HR")
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 60, city: "Denver", category: category)
      job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)
      job_3 = company.jobs.create!(title: "Senior VP", level_of_interest: 60, city: "Denver", category: category)

      expect(Job.location_sort).to eq([job_1, job_3, job_2])

    end
    it "can sort by interest" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: "HR")
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 60, city: "Denver", category: category)
      job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 65, city: "New York City", category: category)
      job_3 = company.jobs.create!(title: "Senior VP", level_of_interest: 70, city: "Denver", category: category)

      expect(Job.interest_sort).to eq([job_3, job_2, job_1])

    end

    it "can sort by location and return a count of jobs at each location" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: "HR")
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 60, city: "Denver", category: category)
      job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 65, city: "New York City", category: category)
      job_3 = company.jobs.create!(title: "Senior VP", level_of_interest: 70, city: "Denver", category: category)

      expect(Job.location_sort_count).to eq({"Denver" => 2, "New York City" =>  1})
    end

    it "can return the top three companies by average level of interest" do
      company = Company.create!(name: "ESPN")
      company_1 = Company.create!(name: "Turing")
      category = Category.create(title: "HR")
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 60, city: "Denver", category: category)
      job_2 = company_1.jobs.create!(title: "QA Analyst", level_of_interest: 60, city: "New York City", category: category)
      job_3 = company.jobs.create!(title: "Senior VP", level_of_interest: 70, city: "Denver", category: category)

      expect(Job.top_three).to eq([["ESPN", 65], ["Turing", 60]])
    end
  end
end
