class CommentsController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @comment = Comment.new
  end

  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    if @comment.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end
end
