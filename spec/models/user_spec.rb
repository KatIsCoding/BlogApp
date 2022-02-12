require 'rails_helper'


RSpec.describe User do
  subject { User.new(name: 'username', postscounter: 1) }

  it 'User`s name should be present' do
    subject.name = nil
    expect(subject.valid?).to be false
  end
  
  it 'Posts counter should be greater or equal to 0' do
    subject.postscounter = -1
    expect(subject.valid?).to be false
  end
end
