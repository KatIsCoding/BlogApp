class Post < ActiveRecord::Base
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'
  # Method that updates the post counter for a given user.
  after_save :update_counter
  def update_counter()
    author.increment!(:postscounter)
  end

  # Method that returns the most recent comments in a post

  def recent_comments()
    comments.order(created_at: :desc).limit(5)
  end
end
