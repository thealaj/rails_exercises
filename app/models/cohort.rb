class Cohort < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
end
