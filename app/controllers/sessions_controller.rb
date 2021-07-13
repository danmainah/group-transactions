class SessionsController < ApplicationController
    def new;end

    def create
      @user = User.find_by(username: params[:username])
      if @user
        log_in @user
        redirect_to root_path, notice: 'You have successfully logged in.'
      else
        redirect_to root_path, alert: "User not found."
      end
    end
  
    def destroy
      log_out
      redirect_to root_url
    end
end
