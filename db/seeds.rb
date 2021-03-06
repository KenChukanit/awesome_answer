# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Like.delete_all
Tagging.delete_all
Tag.delete_all
User.delete_all
Answer.delete_all
Question.delete_all

NUM_QUESTIONS=200
NUM_USER=10
NUM_TAGS=20


PASSWORD='supersecret'
super_user= User.create(
    first_name: 'Jon',
    last_name:'Snow',
    email: 'js@winterfell.gov',
    password: PASSWORD,
    address:   '628 6th Avenue, New Westminster, BC, Canada',
    is_admin: true
)
# Kayleen Breitenberg
NUM_USER.times do
first_name= Faker::Name.first_name 
last_name= Faker::Name.last_name 
User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@example.com",
    address:   '628 6th Avenue, New Westminster, BC, Canada',
    password: PASSWORD
)
end
users=User.all

NUM_TAGS.times do 
    Tag.create(
        name:Faker::Vehicle.make
    )
end
tags=Tag.all

NUM_QUESTIONS.times do
     created_at=Faker::Date.backward(days: 365*5)
    q=Question.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        view_count: rand(100_000),
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )
# puts q.errors.full_messages
    if q.valid?
        q.answers = rand(0..15).times.map do 
            Answer.new(
                body: Faker::GreekPhilosophers.quote, 
                user: users.sample )
        end
        q.likers=users.shuffle.slice(0,rand(users.count))
        q.tags= tags.shuffle.slice(0,rand(tags.count))
    end
end

question=Question.all
answer=Answer.all

puts Cowsay.say("Generated #{question.count} questions.",:frogs)
puts Cowsay.say("Generated #{answer.count} answers.",:tux)
puts Cowsay.say("Generated #{users.count} users.",:beavis)
puts Cowsay.say("Generated #{Like.count} likes.",:bunny)
puts Cowsay.say("Generated #{tags.count} tags.",:sheep)
puts Cowsay.say("Login with  #{super_user.email} and password:#{PASSWORD}.",:koala)



# Some terminal commands to delete create and run migration and seed files

# rails db:drop This will delete database from psql
# rails db:create This will recreate a database
# rails db:migrate To run all the migrations
# rails db:seed To tun the seed file
# rails db:reset To do all above in oneshot you can use this command