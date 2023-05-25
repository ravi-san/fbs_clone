class Friendship < ApplicationRecord
  belongs_to :facebook_user
  
  def send_req(recipient,fb,admin)
    friendship = Friendship.find_or_initialize_by(recipient_id: recipient ,facebook_user_id: fb.id)
    friendship.recipient_id = recipient
    friendship.sender_id = admin.id
    friendship.facebook_user_id = fb.id
    friendship.status = 'pending'
    raise "Dish Creation Failed-#{friendship.errors.full_messages.join(',')}" unless friendship.save
    return friendship
  end
end
