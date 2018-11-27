admin_user = User.create(
    name: "Test Tester",
    email: "test@exampla.com",
    password: '123456789',
    password_confirmation: '123456789'
)

users_arr = []
10.times do
  users_arr << {
      name: Faker::Book.author,
      email: Faker::Internet.free_email,
      password: '123456789',
      password_confirmation: '123456789'
  }
end

users = User.create(users_arr)

50.times do
  Article.create(
      title: Faker::Book.title,
      body: Faker::Lorem.paragraph,
      user_id: users.to_a.sample.id
  )
end

roles = Role.create([
    { name: 'admin' },
    { name: 'reader' },
    { name: 'writer' }
                    ])

admin_user.roles << roles.first
users.each do |user|
  user.roles << roles.to_a.sample
end