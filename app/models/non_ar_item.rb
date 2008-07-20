class NonArItem < ActiveRecord::Base
  include Item
    
  belongs_to :item_service
  
  # have the item_service mix in the correct modules to make 
  # this item behave the correct way. 
  def after_initialize
    if !item_service.nil?
      item_service.mix_into_item(self)
    end
  end
end