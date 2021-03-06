class UsersController < ApplicationController

  def new
	@user = User.new
  end
  
  def index
	@user = User.all
	render json: @user
  end
  
  def currentUser
	@current = User.find(session[:user_id])
	render json: @current
  end
  
  def userName
	@findUser = User.find_by(name: params[:userName])
	render json: @findUser
  end
  
  def create
	@user = User.new(user_params)
	if @user.save
		@project = Project.create(:user_id => @user.id)
		@project.save
		redirect_to users_url
	else
		render 'new'
	end
  end
  
  def delete
	@user = User.find(params[:idInput])
	@user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  def show
	@user = User.find(params[:id])
	render json: @user
  end
  
  def projects
	@user = User.find(params[:idInput])
	@projects = @user.projects
	render json: @projects
  end
  
  private
  
  def user_params
	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
