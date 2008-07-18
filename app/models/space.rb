class Space < ActiveRecord::Base
  acts_as_nested_set
  has_many :space_roles
  has_many :offerings
end
