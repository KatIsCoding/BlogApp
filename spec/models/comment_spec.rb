require 'rails_helper'


RSpec.describe Comment do
  it 'posts increment should be higher when calling update counter' do
    post = Post.new(title: 'title', author: User.new(name: 'username'))
    subject = Comment.new(author: User.new(name: 'username'), post: post, text: "Hello from unit tests")
    subject.update_counter
    expect(post.commentscounter).to be 1
  end
end
