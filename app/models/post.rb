class Post < ActiveRecord::Base

  # Method that updates the post counter for a given user.

  def self.update_counter(user:)
    user.update(postscounter: Post.where(author_id: user.id).count)
  end

  # Method that returns the most recent comments in a post

  def self.recent_comments(post:)
    Comment.where(post_id: post.id).order(created_at: :desc).limit(5)
  end



end
