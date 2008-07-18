class Offering < ActiveRecord::Base
  belongs_to :space
  belongs_to :item_reference
  has_many :child_item_references, :class_name => "ItemReference"
  
  validates_presence_of :item_reference
  
  def item()
    if item_reference.nil?
      return nil
    end
    
    item_reference.lookup_item  
  end
end
