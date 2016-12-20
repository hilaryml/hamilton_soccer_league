class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
    unless authorize team
      redirect_to teams_path
    end
  end

  def new
    @team = Team.new
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

end
