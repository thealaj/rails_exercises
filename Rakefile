# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


task :ar_test => :environment do
  def assert(actual, expected)
    raise "Expected #{actual} to equal #{actual}" unless actual == expected
  end

  def assert_not(actual, expected)
    raise "Expected #{actual} to not equal #{actual}" unless actual != expected
  end

  User.delete_all
  Bike.delete_all

  billy = User.create! :name => 'Billy'

  red = Bike.new :color => 'red'
  red.user_id = billy.id
  red.save!

  blue = Bike.new :color => 'blue'
  billy.bikes << blue

  ### Make sure things persisted correctly
  user = User.find_by(name: 'Billy')
  assert_not(user, nil)
  assert(user.bikes.count, 2)

  bike = Bike.find_by(color: 'red')
  assert_not(bike, nil)
  assert(bike.user.name, 'Billy')
  puts "we rock"
end