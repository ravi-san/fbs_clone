class FacebookUser < ApplicationRecord
  has_many :fb_posts
  has_many :likes
  has_many :comments
  has_many :friendships
  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  has_one_attached :profile_picture


end
