class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.level_of_interest
    order(:level_of_interest).group(:level_of_interest).count
  end

  def self.location_sort
    order(:city)
  end

  def self.interest_sort
    order(level_of_interest: :desc)
  end

  # def self.top_three
  #   group(:company_id).average("level_of_interest").take(3)
  # end
end
