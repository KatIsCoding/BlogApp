class Comment < ActiveRecord::Base


  # Method that updates the comment counter for a post

  def self.update_counter(post:)
    post.update(comments_count: Comment.where(post_id: post.id).count)
  end
end
