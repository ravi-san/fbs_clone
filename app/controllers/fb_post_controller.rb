class FbPostController < ApplicationController
  before_action :fb_user, only: [:index,:new, :show]
  
  def index
    @fbuser = FacebookUser.find_by(id: params.require("user_id"))
  end 

	def show
		@fbb = Friendship.where(recipient_id: params.require("id"))
		@fbpost = FbPost.where(facebook_user_id: @fbb.pluck(:facebook_user_id))
	end


	def new
    @post = FbPost.new
  end

  def create
    @post = FbPost.new(post_params)
    if @post.save
      redirect_to "/facebook_user", notice: 'Post created successfully.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:fbpost).permit(:content, :facebook_user_id, :image)
  end

  def fb_user
     @fb = FacebookUser.find_by(user_id: current_user.id)
  end
end
