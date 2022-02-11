class User < ActiveRecord::Base
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  # A method that returns the last 3 posts of a user using associations

  def last_posts
    posts.order(created_at: :desc).limit(3)
  end
end
