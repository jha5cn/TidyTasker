class ProjectsController < ApplicationController
  def new
  end
  
  def index
	@project = Project.all
	render json: @project
  end
  
  def create
	@project = Project.new
  end
  
    def save
	@project = Project.new(:id => save_params[:id], :user_id => save_params[:user_id])
	if (Project.where("id = '#{@project.id}'").blank?)
		@project.save
	end
end
  
  def tasks
	@project = Project.find(params[:idInput])
	@tasks = @project.tasks
	render json: @tasks
  end
  
    private
  
  def save_params
	params.permit(:id, :user_id)
  end
end
