class FriendshipsController < ApplicationController
    
    def index
    	fbusers = FacebookUser.find_by(user_id: current_user.id)
    	@fri = Friendship.where(recipient_id: fbusers.id, status: "pending")
    end

	def new
		
    	@fbusers = FacebookUser.where.not(user_id: current_user.id)
	end

	def create
		fb = FacebookUser.find_by(user_id: current_user.id)
	    @friendship = Friendship.new.send_req(params[:recipient_id],fb,current_user)
	    if @friendship.save
	      redirect_to "/facebook_user", notice: 'Friend invitation sent.'
	    else
	      redirect_to "/facebook_user", alert: 'Unable to send friend invitation.'
	    end
	end

  	def update
	    friendship = Friendship.find(params[:id])
	    friendship.update(status: 'accepted')
	    redirect_to "/facebook_user", notice: 'Friend invitation accepted.'
	end
end
