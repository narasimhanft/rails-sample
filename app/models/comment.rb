class Comment < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
  validates :micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 50 }
  default_scope -> { order(created_at: :asc) }
  after_create :increment_cmcount_in_micropost
  after_destroy :decrement_cmcount_in_micropost

  private
    def increment_cmcount_in_micropost
      post = Micropost.find(self.micropost_id)
      cmcount = (post.cmcount || 0) + 1
      post.cmcount = cmcount
      post.save
    end

    def decrement_cmcount_in_micropost
      post = Micropost.find(self.micropost_id)
      cmcount = (post.cmcount - 1 ) if !post.cmcount.nil?
      post.cmcount = cmcount
      post.save
    end
end
