class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :jobs

  def self.find_all_jobs(category_id)
    companies = Company.all
    companies.map do |company|
      company.jobs.where(:category_id => category_id)
    end
  end

  # def self.find_all_jobs(category_id)
  #    c = Company.joins(:jobs).where('jobs.category_id' => category_id)
  #    #return a company object for all companies with jobs
  # end
end
