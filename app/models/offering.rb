class Offering < ActiveRecord::Base
  belongs_to :space
  belongs_to :item, :polymorphic => true

  # because our child_items can be in any of the item tables we need
  # to track what types of items are created by this offering
  def child_items
    if child_item_type.blank?
      return []
    end
    
    child_item_type_class = eval(child_item_type);
    child_item_type_class.find_all_by_offering_id(id)  
  end

  validates_presence_of :item  
    
end
