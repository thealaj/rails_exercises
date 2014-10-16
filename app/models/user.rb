class User < ActiveRecord::Base
  has_many :memberships
  has_many :cohorts, through: :memberships
end
