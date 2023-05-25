class Comment < ApplicationRecord
  belongs_to :facebook_user
  belongs_to :fb_post
end
