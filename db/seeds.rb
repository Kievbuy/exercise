10.times do
    User.create(
      name: Faker::Book.author,
      email: Faker::Internet.free_email,
      password: '123456789',
      password_confirmation: '123456789'
    )
end

roles = Role.create([
    { name: 'Admin' },
    { name: 'Reader' },
    { name: 'Writer' }
                    ])
