class PracticesController < ApplicationController

  def new
    @practice = Practice.new
  end

  def create
    @practice = Practice.new(practice_params)
    if @practice.valid?
      if authorize @practice
        current_user.team.practices << @practice
        @practice.save
        redirect_to team_path(current_user.team), alert: "Practice successfully created."
      else
        redirect_to team_path(current_user.team), alert: "You are not authorized to complete this action."
      end
    else
      render :new
    end
  end

  private

  def practice_params
    params.require(:practice).permit(:date, :time, :location)
  end

end
