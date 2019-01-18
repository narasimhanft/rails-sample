class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :followers, through: :favourites, source: :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }

  def comm_feed
    Comment.where("micropost_id = ?", id)
  end

  def fav(usr)
    favourites << usr
  end

  def unfav(usr)
    favourites.delete(usr)
  end

  def isFav?(usr)
    favourites.include?(usr)
  end
end
