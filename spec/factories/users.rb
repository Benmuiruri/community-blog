FactoryBot.define do
  factory :user, aliases: [:author, :commenter] do
    name {"Joe"}
    photo {"www.example.com"}
    bio {"Teacher from Kenya"}
    sequence(:email) { |n| "test-#{n}@example.com" }
    posts_counter {0}
    password { "password"} 
    password_confirmation { "password" }
    confirmed_at { Date.today }
  end

  factory :post do
    author
    title {'The amazing article title'}
    text { 'Some amazing text'}
    likes_counter {1}
    comments_counter {0}
  end

  factory :comment do
    author
    post
    text { 'An amazing comment'}
  end
end