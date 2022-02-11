class Like < ActiveRecord::Base
  belongs_to :post, class_name: 'Post'
  belongs_to :author, class_name: 'User'
  # Method that updates the likes counter for a post
  after_save :update_counter

  def update_counter()
    post.increment!(:likescounter)
  end
end
