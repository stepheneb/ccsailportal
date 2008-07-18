module QisItem
  def item_service()
    # assume there is only one QuestionItemService
    QuestionItemService.first
  end
  
  def external_item_id()
    if(self.is_a? ActiveRecord::Base)
      raise "external_item_id should not be called for active record items"
    end
    
    self.class.to_s
  end
  
  def name()
    # FIXME for now just return our classname
    self.class.to_s
  end
  
  def create_offering()
    find_or_create_item_ref.offerings.create!    
  end
  
  def find_or_create_item_ref()
    if(self.is_a? ActiveRecord::Base)
      if self.new_record?
        raise "need to save item before creating item_ref"
      end
      # the item association in ItemReference is polymorphic
      item_service.item_references.find_or_create_by_item_id_and_item_type_and_item_service_id(id, self.class.to_s, item_service.id)
    else
      item_service.item_references.find_or_create_by_external_item_id_and_item_service_id(external_item_id, item_service.id)       
    end
  end
  
  def actions(offering = nil)
    # return a set of urls for working with this item
    # if these actions are actually on an offering then that will need to be 
    # passed in 
    # return an empty set by default   
    return []
  end
  
  def current_owners()
    find_or_create_item_ref.current_owners
  end
end
