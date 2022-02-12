require 'rails_helper'


RSpec.describe Like do
  it 'likes increment should be higher when calling update counter' do
    post = Post.new(title: 'title', author: User.new(name: 'username'))
    subject = Like.new(author: User.new(name: 'username'), post: post)
    subject.update_counter
    expect(post.likescounter).to be 1
  end
end
