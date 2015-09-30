class TasksController < ApplicationController
	skip_before_filter	:verify_authenticity_token

  def new
  end
  
  def index
	@task = Task.all
	render json: @task
  end
  
  def save
	@task = Task.new(:id => save_params[:id], :project_id => save_params[:project_id], :title => save_params[:title], :timePoints => save_params[:timePoints], :description => save_params[:description], :inProgress => save_params[:inProgress], :completed => save_params[:completed], :removed => save_params[:removed])
	if (Task.where("id = '#{@task.id}'").blank?)
		@task.save
	else
		Task.update(@task.id, title: @task.title, timePoints: @task.timePoints, description: @task.description, inProgress: @task.inProgress, completed: @task.inProgress, removed: @task.removed)
	end
end
  
  private
  
  def save_params
	params.permit(:id, :project_id, :title, :timePoints, :description, :inProgress, :completed, :removed)
  end
end
