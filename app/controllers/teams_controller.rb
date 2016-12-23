class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :schedule, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
    unless authorize @team
      redirect_to teams_path
    end
  end

  def schedule
  end

  def new
    @team = Team.new
    @coach = @team.users.build
	  @players = 15.times do
		     @team.users.build
    end
	end

  end

  def create
    team = Team.new(team_params)
    if authorize team
      team.save
      redirect_to team_path(team)
    else
      redirect_to new_team_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(
      :name,
      coach_attributes: [
        :name,
        :email,
        :password,
        :password_confirmation
      ]
      players_attributes: [
        :name,
        :email,
        :password,
        :password_confirmation
      ]
    )
  end

end
