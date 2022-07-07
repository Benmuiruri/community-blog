require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Monica', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0)}

  before { subject.save }

  it 'is not valid with a name less than 3 characters' do
    subject.name = 'M'
    expect(subject).to_not be_valid
  end

   it 'is valid with a name of more than 3 characters' do
    expect(subject).to be_valid
  end

  it 'is not without post_counter equal or greater than 0' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'is is valid with post_counter equal or greater than 0' do
    expect(subject).to be_valid
  end
end
