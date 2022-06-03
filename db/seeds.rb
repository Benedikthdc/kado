# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'

User.destroy_all

avatars = ["https://images.unsplash.com/photo-1633332755192-727a05c4013d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180","https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800", "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800", "https://images.barrons.com/im-169834?width=1280&size=1", "https://images.unsplash.com/photo-1520078452277-0832598937e5?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJ1c2luZXNzJTIwbWVufGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=800", "https://images.unsplash.com/photo-1630724725268-8272ac390de7?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA5fHxidXNpbmVzcyUyMG1lbnxlbnwwfDJ8MHx8&auto=format&fit=crop&w=800"]

admin = User.new(avatar: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180", name: "Silke meyer", email: "admin@kado.com", password: "123456")
admin.save!

10.times do
  user = User.new(avatar: avatars.sample, name: Faker::Name.name, email: Faker::Internet.email, password: "123456")
  user.save!
end

project = Project.new(name: "test", date: Date.today, user: User.first)
project.save!

project.users << User.second
project.users << User.third
