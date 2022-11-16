class UsersController < ApplicationController 
  include SessionsHelper

before_action :logged_in_user, only: [:index, :edit, :update]
  def index 
    @users = User.paginate(page: params[:page], per_page:3) 
  end

  def show 
  	@user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def edit 
     @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       redirect_to @user
     render 'edit'
    end
  end 

  def create 
  	@user = User.new(user_params)
     if @user.save 
     	flash[:success] = "Welcome to the Sample App!"
     	session[:user_id] = @user.id
     	redirect_to root_path
     else
     	byebug
     	render :new

     	flash[:danger] = "something wrong"
     end 
  end
  private 

  def user_params 
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
   
end