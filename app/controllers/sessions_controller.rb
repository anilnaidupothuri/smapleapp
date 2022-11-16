class SessionsController < ApplicationController 
include SessionsHelper
   def home
        
   end
   def new 
   end
   def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
         session[:user_id] = user.id
         params[:session][:remember_me] == '1' ? remember(user) :
forget(user)
         flash[:success] = 'login successfully'
         redirect_to user

      else
         flash.now[:danger] = 'Invalid email/password combination'
         render 'new'
      end
   end

   def destroy 
      log_out if logged_in?
      render 'new'
   end

end 
