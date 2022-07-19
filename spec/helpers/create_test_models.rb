def create_user(name)
  user = User.create!(name:,
                      photo: 'https://res.cloudinary.com/optprime/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1657633795/community_blog/alex-suprun-ZHvM3XIOHoE-unsplash_qzncr6.jpg', bio: 'Teacher from Kenya.', posts_counter: 0)
  user.save
  user
end
