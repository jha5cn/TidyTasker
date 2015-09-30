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
  
  def tasks
	@project = Project.find(params[:idInput])
	@tasks = @project.tasks
	render json: @tasks
  end
end
