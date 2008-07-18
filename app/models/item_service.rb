class ItemService < ActiveRecord::Base
  has_many :item_references
end
