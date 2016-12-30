class CommentsController < ApplicationController

  def new
    #@comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to team_game_path(current_user.team, @comment.game)
    else
      redirect_to teams_path, alert: "Unsuccessful. Please, try again."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
