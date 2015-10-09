# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdminUser.create!(email: 'admin@example.com', password: '12345678', password_confirmation: '12345678')


Worker.create!(name: 'Mad Max', task: 'Build a car')
Worker.create!(name: 'Luke S.', task: 'Use the Force')
Worker.create!(name: 'Hulk', task: 'Smash something')


user = User.new
user.email = 'user@example.com'
user.password = '12345678'
user.password_confirmation = '12345678'
user.save!