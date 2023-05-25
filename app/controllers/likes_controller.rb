class LikesController < ApplicationController
  before_action :fb_user, only: [:create, :destroy]

  def show
    @like = Like.where(fb_post_id: params[:id])
  end

  def create
    @like = Like.new.create_like(@fbu,params[:fb_post_id])
    if @like.present?
      redirect_to "/fb_post/#{@fbu.id}", notice: 'Post liked.'
    else
      redirect_to "/fb_post/#{@fbu.id}", alert: 'Unable to like the post.'
    end
  end

  def destroy
    @like = Like.find_by(fb_post_id: params[:id],facebook_user_id: @fbu.id)
    if @like.destroy
      redirect_to "/fb_post/#{@fbu.id}", notice: 'Post unliked.'
    else
      redirect_to "/fb_post/#{@fbu.id}", alert: 'Unable to unlike the post.'
    end
  end

  private

  def fb_user
    @fbu = FacebookUser.find_by(user_id: current_user.id)
  end
end
