class CommentsController < ApplicationController

  def new
  end

  def create
    @comment = Comment.create(comment_params)
    render json: @comment, status: 201
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :game_id)
  end

end
