class CommentsController < ApplicationController

  def show
    @com = Comment.where(fb_post_id: params[:id])
  end

	def create
    @fbu = FacebookUser.find_by(user_id: current_user.id)
    @comment = Comment.new(comment_params)
    @comment.fb_post_id = params[:fb_post_id]
    @comment.facebook_user_id = @fbu.id
    if @comment.save
      redirect_to "/fb_post/#{@fbu.id}", notice: 'Comment created successfully.'
    else
      redirect_to "/fb_post/#{@fbu.id}", alert: 'Unable to create comment.'
    end
  end
  

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
