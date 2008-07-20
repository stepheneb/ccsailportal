module Item
  
  def Item.included(mod)
    mod.class_eval do
      belongs_to :parent_offering, :foreign_key => :offering_id, :class_name => 'Offering'
      has_many   :offerings, :as => :item
      has_many   :item_owners, :as => :item      

      # this aliases(copies it) parent_offering= to parent_offering_without_side_effect=
      # then aliases parent_offering_with_side_effect= to  parent_offering=
      alias_method_chain :parent_offering=, :side_effect
    end    
  end

  def parent_offering_with_side_effect=(offering)
    # self. is required because the method is defined in the object this module
    # is included in.  Without the self the method is looked for in the this module
    # or its parents instead of in the object it is called on.
    self.parent_offering_without_side_effect= offering
    store_child_item_type offering
  end
  
  def store_child_item_type(offering)
    if !offering.child_item_type.blank? and offering.child_item_type != self.class.name
      raise "one offering cannot be the parent of different item types"
    end
    
    offering.child_item_type = self.class.name
    offering.save
  end
  
  def actions(offering = nil)
    # return a set of urls for working with this item
    # if these actions are actually on an offering then that will need to be 
    # passed in 
    # return an empty set by default   
    return []
  end  

  
  def name()
    # FIXME for now just return our classname
    self.class.to_s
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