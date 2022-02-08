class Like < ActiveRecord::Base
  # Method that updates the likes counter for a post

  def self.update_counter(post:)
    post.update(likescounter: Like.where(post_id: post.id).count)
  end
end
