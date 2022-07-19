def create_user(name)
  user = User.create!(name:,
                      photo: 'https://res.cloudinary.com/optprime/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1657633795/community_blog/alex-suprun-ZHvM3XIOHoE-unsplash_qzncr6.jpg', bio: 'Teacher from Kenya.', posts_counter: 0)
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