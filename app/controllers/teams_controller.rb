class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :schedule, :edit, :update, :destroy]

  def index
    @teams = Team.all

    if params["team standings"] == "standings"
      @teams = Team.wins
    elsif params["team standings"] == "top five teams"
      @teams = Team.top_five_teams
    else
      @teams = Team.all
    end
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
	  @users = 15.times { @team.users.build }
	end

  def create
    @team = Team.new(team_params)
    if @team.valid?
      if authorize @team
        @team.save
        redirect_to team_path(@team), alert: "Team successfully created."
      else
        redirect_to new_team_path, alert: "You are not authorized to complete this action."
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if authorize @team
      @team.update(team_params)
      redirect_to team_path(@team), alert: "Team successfully updated."
    else
      redirect_to teams_path, alert: "You are not authorized to complete this action."
    end
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
      users_attributes: [
        :name,
        :email,
        :password,
        :role
      ]
    )
  end

end
