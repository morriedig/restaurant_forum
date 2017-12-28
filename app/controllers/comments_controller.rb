class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.restaurant_id = params[:restaurant_id]
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.admin?  
      @comment.destroy
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :restautant_id)
  end


end
