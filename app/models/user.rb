class User < ActiveRecord::Base
  # A method that returns the 3 most recent posts for a given user.
  # The author_id is passed in as a parameter.
  #
  # @param author_id [Integer]
  # @return [Array]
  #
  def self.recent_posts(user:)
    Post.where(author_id: user.id).order(created_at: :desc).limit(3)
  end
end
