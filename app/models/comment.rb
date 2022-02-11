class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  # Method that updates the comment counter for a post
  after_save :update_counter

  def update_counter()
    post.increment!(:commentscounter)
  end
end
