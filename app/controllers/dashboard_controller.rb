class DashboardController < ApplicationController
  def show
    @level_of_interest = Job.level_of_interest
  end
end
