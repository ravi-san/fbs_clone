class FacebookUserController < ApplicationController
  
  def index
    @user = FacebookUser.find_by(user_id: current_user)
    @post = FbPost.where(facebook_user_id: @user.id) if @user.present?
  end

  def create
    @user = FacebookUser.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      redirect_to facebook_user_index_path(@user)
    else
      render :new
    end
  end

  def show
    @user = FacebookUser.find(params[:id])
  end

  private

  def user_params
    params.require(:facebookuser).permit(:name, :age, :interests, :profile_picture)
  end
end
