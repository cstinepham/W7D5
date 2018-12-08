class SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil?
        flash.now[:errors] = ['Invalid username or password.']
        render :new
    else
    # Log them in and redirect them if we find them
      login!(@user)
      redirect_to user_url(@user)
    end 

    def destroy
        logout!
        redirect_to new_session_url
    end 


end 