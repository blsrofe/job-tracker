class DashboardController < ApplicationController
  def show
    @level_of_interest = Job.level_of_interest
    @cities = Job.location_sort_count
    @top_three = Job.top_three
  end
end
