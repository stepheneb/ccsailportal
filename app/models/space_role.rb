class SpaceRole < ActiveRecord::Base
  belongs_to :space
  has_many :user_space_roles
  has_many :users, :through => :user_space_roles
end
