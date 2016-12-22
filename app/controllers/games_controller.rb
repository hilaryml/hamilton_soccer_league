class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    if authorize game
      game.save
      redirect_to team_path(current_user.team), alert: "Game successfully created."
    else
      redirect_to team_path(current_user.team), alert: "You are not authorized to complete this action."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:date, :time, :location)
  end

end
