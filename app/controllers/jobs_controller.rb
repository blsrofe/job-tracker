class JobsController < ApplicationController
  def index
    if params[:location] != nil
      @jobs = Job.only_for_city(params[:location])
    elsif params[:sort] == "location"
      @jobs = Job.location_sort
    else
      @jobs = Job.interest_sort
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @company = @job.company
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @company = @job.company
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
