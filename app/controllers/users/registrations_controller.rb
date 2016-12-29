class Users::RegistrationsController < Devise::RegistrationsController

  def update
    @user = User.find(current_user.id)
    if @user.provider == "facebook"
      params[:user].delete(:current_password)
      @user.update_without_password(user_params)
      redirect_to team_user_path(@user.team, @user)
    else
      @user.update_with_password(user_params)
      redirect_to team_user_path(@user.team, @user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :team_id, :role)
  end

end
