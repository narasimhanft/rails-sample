class CmctupdateJob < ApplicationJob
  queue_as :default

  def perform(post)
    # Do something later
    cmcount = (post.cmcount || 0) + 1
    post.cmcount = cmcount
    post.save
  end
end
