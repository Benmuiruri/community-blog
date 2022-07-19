def create_user(name)
  user = User.create!(name:, photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Kenya.', posts_counter: 0)
  user.save 
  user
end