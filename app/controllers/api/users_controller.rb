class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            # Tell the user that something went wrong. Let them try again.
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end
end
