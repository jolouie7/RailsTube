# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)ame


10.times do 
    User.create(
    name: Faker::Name.unique.name,
    username: Faker::Internet.username,
    password_digest: Faker::Internet.password,
    age: rand(18..60),
    gender: ['Male', 'Female'].sample
)
end

10.times do 
    Post.create(
        user_id: rand((User.all.first.id)..(User.all.last.id)),
        name: Faker::Book.title,
        description: Faker::Lorem.paragraphs,
        like: rand(1..3)
    )
end

5.times do
    Comment.create(
        post_id: rand((Post.all.first.id)..(Post.all.last.id)),
        description: Faker::Lorem.sentences
    )
end
