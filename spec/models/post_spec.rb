require 'rails_helper'

RSpec.describe Post do
  subject do
    Post.new(author: User.new(name: 'Testuser', postscounter: 1), commentscounter: 1, likescounter: 1,
             title: 'Hello test')
  end

  it 'Post`s title should be present' do
    subject.title = nil
    expect(subject.valid?).to be false
  end

  it 'Comments counter should be greater or equal to 0' do
    subject.commentscounter = -1
    expect(subject.valid?).to be false
  end

  it 'Likes counter should be greater or equal to 0' do
    subject.likescounter = -1
    expect(subject.valid?).to be false
  end

  it 'Object should be valid' do
    expect(subject.valid?).to be true
  end
end
