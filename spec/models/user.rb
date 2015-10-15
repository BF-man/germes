require "rails_helper"

RSpec.describe User, :type => :model do
  it "name without spaces method" do
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

    users = User.order(:name)
    users.each do |an_user|
      expect(an_user.name_without_spaces).to eq(an_user.name.gsub(/\s/, "_"))
    end
  end
end