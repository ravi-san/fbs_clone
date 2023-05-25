class FbPost < ApplicationRecord
  belongs_to :facebook_user
  has_many :likes
  has_many :comments

  has_one_attached :image
end
