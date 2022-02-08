class Like < ActiveRecord::Base
  belongs_to :post, class_name: 'Post'
  # Method that updates the likes counter for a post
  after_save :update_counter

  def update_counter()
    post.increment!(:likescounter)
  end
end
