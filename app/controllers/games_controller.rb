class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.valid?
      if authorize @game
        current_user.team.games << @game
        game.save
        redirect_to team_path(current_user.team), alert: "Game successfully created."
      else
        redirect_to team_path(current_user.team), alert: "You are not authorized to complete this action."
      end
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:date, :time, :location)
  end

end
