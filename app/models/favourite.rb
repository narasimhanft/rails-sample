class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates :user_id, presence: true,  :uniqueness => { :scope => :micropost_id }
  validates :micropost_id, presence: true
end
