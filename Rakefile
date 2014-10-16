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
  Cohort.delete_all
  Membership.delete_all

  alice = User.create! :name => 'Alice'
  bob   = User.create! :name => 'Bob'
  carl  = User.create! :name => 'Carl'
  green = Cohort.create! :name => 'Class Green'
  black = Cohort.create! :name => 'Class Black'

  Membership.create!(
    :user_id => bob.id,
    :cohort_id => black.id,
    :role => 'student'
  )

  Membership.create!(
    :user_id => carl.id,
    :cohort_id => green.id,
    :role => 'student'
  )

  alice.memberships.create!(
    :role => 'teacher',
    :cohort_id => green.id
  )

  black.memberships.create!(
    :role => 'teacher',
    :user_id => alice.id
  )
  black.memberships.create!(
    :role => 'student',
    :user_id => carl.id
  )

  ### Make sure things persisted correctly
  user = User.find_by(name: 'Alice')
  assert_not(user, nil)
  assert(user.memberships.count, 2)
  assert(user.cohorts.count, 2)

  cohort = Cohort.find_by(name: 'Class Black')
  assert_not(cohort, nil)
  assert(cohort.users.count, 3)
  assert(cohort.memberships.count, 3)
  assert(cohort.memberships.where(:role => 'student').count, 2)

  cohort = Cohort.find_by(name: 'Class Green')
  assert_not(cohort, nil)
  assert(cohort.users.count, 2)
  assert(cohort.memberships.count, 2)
  assert(cohort.memberships.where(:role => 'teacher').count, 1)
end