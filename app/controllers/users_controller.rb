class UsersController < ApplicationController
  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to root_path, notice: 'User account successfully created.'
    else
      redirect_to new_user_path, notice: @user.errors[:username].first
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
