class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def show
    unless authorize @user
      redirect_to users_path
    end
  end

  def new
  end

  def create
    user = User.new(user_params)
    if authorize user
      user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    if authorize @user
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to users_path
    end
  end

  def destroy
    if current_user
      authorize @user
      @user.destroy
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :team_id, :role)
  end

end
