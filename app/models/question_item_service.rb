class QuestionItemService < ItemService
  def item_collections()
    author_collection = ItemCollection.new
    author_collection.items = [QisQuestionCreationTool.singleton]
    learner_collection = ItemCollection.new
    learner_collection.items = [] << QisQuestion.all  
    [ author_collection , learner_collection]
  end
  
  def mix_into_item(item)
    item_module = eval(item.external_item_id)
    item.extend item_module
  end

end

