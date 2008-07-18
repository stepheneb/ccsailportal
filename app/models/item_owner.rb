class ItemOwner < ActiveRecord::Base
  belongs_to :user
  belongs_to :item_reference
end
