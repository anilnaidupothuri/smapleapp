class UsersController < ApplicationController 

  def index 
    @users = User.all 
  end

  def show 
  	@user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def create 
  	@user = User.new(user_params)
     if @user.save 
     	flash[:success] = "user created succefully"
     	redirect_to root_path
     end 
  end
end