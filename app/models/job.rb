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

  def self.location_sort_count
    order(:city).group(:city).count
  end

  def self.top_three
    joins(:company).group(:name).average(:level_of_interest)
    .sort_by { |k, v| v }.reverse.first(3)
  end

end
