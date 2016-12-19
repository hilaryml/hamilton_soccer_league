class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def show
    unless authorize @user
      redirect_to users_path, alert: "Access denied."
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    if authorize @user
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to users_path, alert: "Access denied."
    end
  end

  def destroy
    if current_user
      authorize @user
      @user.destroy
      redirect_to users_path, alert: "Successfully deleted user."
    else
      redirect_to users_path, alert: "Access Denied."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :team, :role)
  end

end
