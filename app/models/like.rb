class Like < ApplicationRecord
  belongs_to :facebook_user
  belongs_to :fb_post

  def create_like(fb,post)
    like = Like.new
    like.fb_post_id = post
    like.facebook_user_id = fb.id
    like.status = 1
    raise "Dish Creation Failed-#{like.errors.full_messages.join(',')}" unless like.save
    return like  
  end
end
