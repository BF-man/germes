# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.delete_all
AdminUser.create!(email: 'admin@example.com', password: '12345678', password_confirmation: '12345678')

User.delete_all

user = User.new
user.email = 'Hulk@example.com'
user.name = 'Hulk'
user.task = 'Smash something'
user.password = '12345678'
user.password_confirmation = '12345678'
user.save!

user = User.new
user.email = 'Skywalker@example.com'
user.name = 'Luke S.'
user.task = 'Use the Force'
user.password = '12345678'
user.password_confirmation = '12345678'
user.save!

user = User.new
user.email = 'MadMax@example.com'
user.name = 'Mad Max'
user.task = 'Build a car'
user.password = '12345678'
user.password_confirmation = '12345678'
user.save!

showbill = Showbill.new
showbill.description = 'Some description'
showbill.save!