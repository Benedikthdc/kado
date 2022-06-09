# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'
require "open-uri"

User.destroy_all
Project.destroy_all
# new seeds for demo

avatars = ["https://images.unsplash.com/photo-1633332755192-727a05c4013d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180","https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800", "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800", "https://images.barrons.com/im-169834?width=1280&size=1", "https://images.unsplash.com/photo-1520078452277-0832598937e5?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJ1c2luZXNzJTIwbWVufGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800", "https://images.unsplash.com/photo-1630724725268-8272ac390de7?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA5fHxidXNpbmVzcyUyMG1lbnxlbnwwfDJ8MHx8&auto=format&fit=crop&w=800"]

puts "Creating admin"
file = open(Rails.root.join("app/assets/images/IMG_2587.jpeg"))
admin = User.new(
  # avatar: ("/app/assets/images/IMG_2587.jpeg"),
  name: "Benedikt Conze",
  email: "benedikt@conze.com",
  password: "123456",
  iban: "1323 1637 132599",
  paypal: "benedikt@conze.com"
)
admin.photo.attach(io: file, filename: admin.name, content_type: 'image/jpg')
admin.save!
print "- finished"

puts "Creating users"
file = URI.open("https://images.unsplash.com/photo-1633332755192-727a05c4013d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180")
user = User.new(
  name: "James Smith",
  email:Faker::Internet.email,
  password: "123456"
)
puts user.name
user.photo.attach(io: file, filename: user.name, content_type: 'image/jpg')
user.save!

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/d/da/Jeremy_Zucker_Supercuts.png")
jeremy = User.new(
  name: "Jeremy Stock",
  email: "jeremy@stock.com",
  password: "123456",
  iban: "2362 32692 003269",
  paypal: "jeremy@stock.com"

)
jeremy.photo.attach(io: file, filename: "jeremy", content_type: "image/png" )
jeremy.save!

file = URI.open("https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800")
  user = User.new(
    name:"Robert Müller" ,
    email:Faker::Internet.email,
    password: "123456"
  )
  puts user.name
  user.photo.attach(io: file, filename: user.name, content_type: 'image/jpg')

  user.save!

  file = URI.open("https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800")
  user = User.new(
    name:"Taylor Davies" ,
    email:Faker::Internet.email,
    password: "123456"
  )
  puts user.name
  user.photo.attach(io: file, filename: user.name, content_type: 'image/jpg')
  user.save!


  file = URI.open("https://images.barrons.com/im-169834?width=1280&size=1")
  user = User.new(
    name:"Leo Torres" ,
    email:Faker::Internet.email,
    password: "123456"
  )
  user.photo.attach(io: file, filename: user.name, content_type: 'image/jpg')
  user.save!


  file = URI.open("https://images.unsplash.com/photo-1520078452277-0832598937e5?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJ1c2luZXNzJTIwbWVufGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800")
  user = User.new(
    name:"Henry Sneyders" ,
    email:Faker::Internet.email,
    password: "123456"
  )
  puts user.name
  user.photo.attach(io: file, filename: user.name, content_type: 'image/jpg')
  user.save!


  file = URI.open("https://images.unsplash.com/photo-1630724725268-8272ac390de7?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA5fHxidXNpbmVzcyUyMG1lbnxlbnwwfDJ8MHx8&auto=format&fit=crop&w=800")
  user = User.new(
    name:"Joseph McKinn" ,
    email:Faker::Internet.email,
    password: "123456"
  )
  puts user.name
  user.photo.attach(io: file, filename: user.name, content_type: 'image/jpg')
  user.save!


  file = URI.open("https://images.unsplash.com/photo-1584999734482-0361aecad844?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80")
  user = User.new(
    name:"Stanley Brown" ,
    email:Faker::Internet.email,
    password: "123456"
  )
  puts user.name
  user.photo.attach(io: file, filename: user.name, content_type: 'image/jpg')
  user.save!


  file = URI.open("https://images.unsplash.com/photo-1555703473-5601538f3fd8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1458&q=80")
  user = User.new(
    name:"Maria Garcia" ,
    email:Faker::Internet.email,
    password: "123456"
  )
  puts user.name
  user.photo.attach(io: file, filename: user.name, content_type: 'image/jpg')
  user.save!


  file = URI.open("https://images.unsplash.com/photo-1535931737580-a99567967ddc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80")
  user = User.new(
    name:"Clark Williams" ,
    email:Faker::Internet.email,
    password: "123456"
  )
  puts user.name
  user.photo.attach(io: file, filename: user.name, content_type: 'image/jpg')
  user.save!


  file = URI.open("https://images.unsplash.com/photo-1526382925646-27b5eb86796e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80")
  user = User.new(
    name:"Patricia Cordon" ,
    email:Faker::Internet.email,
    password: "123456"
  )
  puts user.name
  user.photo.attach(io: file, filename: user.name, content_type: 'image/jpg')
  user.save!
puts "- finished"

jordans = URI.open("https://img01.ztat.net/article/spp-media-p1/989dcb97263c4aed8380fc927e3e97fb/cf78d7a468a04606aabc85fd4c9097a5.jpg?imwidth=1800&filter=packshot")
project = Project.new(name: "Birthday Present Jeremy", date: "2022-06-20", user: User.first)
project.save!
project.users << User.all
jordan_idea = Idea.new(title: "Jordan 1's", user: User.last, price: 230)
jordan_idea.photo.attach(io: jordans, filename: "jordans", content_type:"image/jpg")
project.ideas << jordan_idea


bali_file = URI.open("https://www.goway.com/media/cache/bc/50/bc50ea901f91dba4ca69ca7dbea58d44.jpg")
project = Project.new(name: "Lisa's wedding", date: "2022-06-11", user: jeremy)
project.users << User.all
project.ideas << Idea.new(title: "Trip to bali", user: jeremy, price: 8300)
project.ideas.first.photo.attach(io: bali_file, filename: "bali", content_type: 'image/jpg')
project.save!

project.users.last(20).each do |user|
  project.ideas.first.votes << Vote.new(user: user, value: 1)
end

baby_file = URI.open("https://ae01.alicdn.com/kf/Hcbb4690678c54bef9c78c1daae7075a51/We-Love-Hasbulla-funda-de-almohada-Mini-Khabib-funda-de-almohada-de-lino-y-algod-n.jpg")
baby = Project.new(name: "Gift for Gonzo", date: "2022-06-12", user: admin)
baby.users << User.all
baby.ideas << Idea.new(title: "Hasbulla pillow", user: User.last, price: 42)
baby.ideas.first.photo.attach(io: baby_file, filename: "hasbulla", content_type: "image/jpg")
baby.save!

baby.users.last(20).each do |user|
  baby.ideas.first.votes << Vote.new(user: user, value: 1)
end


puts "Creating fake users"
30.times do
  file = URI.open(avatars.sample)
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
  )
  puts user.name
  user.photo.attach(io: file, filename: user.name, content_type: 'image/jpg')
  user.save!
end
puts "- finished"
