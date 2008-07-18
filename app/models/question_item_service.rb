class QuestionItemService < ItemService
  def item_collections()
    author_collection = ItemCollection.new
    author_collection.items = [QisQuestionCreationTool.singleton]
    learner_collection = ItemCollection.new
    learner_collection.items = [] << QisQuestion.all  
    [ author_collection , learner_collection]
  end
  
  def item(item_reference)
    # if the item_reference has an item just return that
    if (!item_reference.item.nil?) 
      return item_reference.item
    end

    # we should now be looking in the external_item_id field
    # which will hold the name of a class that has a class method
    # for returning an instance of itself. 
    eval(item_reference.external_item_id + ".singleton");
  end
end

