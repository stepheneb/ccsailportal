class ItemReference < ActiveRecord::Base
  belongs_to :item_service
  belongs_to :parent_offering, :foreign_key => :offering_id, :class_name => "Offering"
  belongs_to :item, :polymorphic => true
  has_many   :offerings
  has_many   :item_owners


  validates_presence_of :item_service

  # this is temporary, because with external items this won't be true
  validates_presence_of :item

  def name
    item_service.item(self).name  
  end

  def lookup_item
    item_service.item(self)
  end
  
  def current_owners
    users = []
    item_owners.find_all_by_version(owners_version).each do |owner|
      users << owner.user
    end
    users
  end
  
  def owners=(new_owners)
    if self.owners_version.nil?
      self.owners_version = 0
    else
      self.owners_version = self.owners_version + 1
    end
    self.save
    
    new_owners.each do |new_owner|
      item_owners << ItemOwner.new(:user => new_owner, :version => self.owners_version)      
    end
  end
end
