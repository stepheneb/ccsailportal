class NonArItem < ActiveRecord::Base
  include Item
    
  belongs_to :item_service
  
end