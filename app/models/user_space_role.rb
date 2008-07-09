class UserSpaceRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :space_role
end
