class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if authorize @game
      @game.save
      redirect to teams_schedule_path(@game.team)
    else
      redirect to teams_schedule_path(@game.team)
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
    params.require(:game).permit(:datetime, :location)
  end

end
