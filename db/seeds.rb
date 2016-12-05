5.times do
  User.create({ username: Faker::Beer.name,
                email: Faker::Internet.email,
                password: 'password'
    })
end

16.times do
  Post.create({ title: Faker::GameOfThrones.character,
                body: Faker::Lorem.paragraph(2),
                user: User.all.sample
    })
end
