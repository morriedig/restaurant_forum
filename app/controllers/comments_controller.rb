class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.restaurant_id = params[:restaurant_id]
    if @comment.save
    else
      @comment = Comment.new(content: params[:comment])
    end

  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    if current_user.admin?  
      @comment.destroy
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :restaurant_id)
  end


end
