class SessionsController < ApplicationController 

   def home
        
   end
   def new 
   end
   def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
         session[:user_id] = user.id
         flash[:success] = 'login successfully'
         redirect_to user

      else
         flash.now[:danger] = 'Invalid email/password combination'
         render 'new'
      end
   end

   def destroy 
      @current_user = nil
      render 'new'
   end

end 
