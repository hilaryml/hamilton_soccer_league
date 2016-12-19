class TeamsController < ApplicationController

  before_action :set_team

  def index
  end

  def show
  end

  def new
  end

  def create
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
