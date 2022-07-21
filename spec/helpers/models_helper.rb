def create_and_activate_user(name)
  user = User.create!(
    name:, photo: "#{name}.jpg", bio: "Bio of #{name}", password:  "password", password_confirmation:  "password", confirmed_at: Date.today, email: "test@gmail.com"
  )
  user.save!
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

def create_comments_for_post_by_user(post, author, count: 1)
  comments = []
  count.times do |i|
    comments << Comment.create!(
      author:,
      post:,
      text: "Comment #{i}"
    )
  end
  comments
end
