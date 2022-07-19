def create_user(name)
  user = User.create!(name:,
                      photo: 'https://www.example.com/image', bio: 'Teacher from Kenya.', posts_counter: 0)
  user.save
  user
end

def create_posts_for_user(author, count: 1)
  posts = []
  count.times do |i|
    posts << Post.create!(
      author:,
      title: "Post #{i}",
      text: "This is body of post #{i}",
      comments_counter: 0,
      likes_counter: 0
    )
  end
  posts
end
