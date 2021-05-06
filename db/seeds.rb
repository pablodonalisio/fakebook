require 'faker'

Post.destroy_all
User.destroy_all

5.times do
  user = User.create(
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'asdfgh',
      password_confirmation: 'asdfgh'
    }
  )

  user.profile.update(
    {
      birthday: Faker::Date.birthday,
      city: Faker::Address.city,
      photo: Faker::Avatar.image
    }
  )
end

User.take(2).each do |user|
  user.posts.create(
    {
      body: Faker::Lorem.paragraph
    }
  )
end
