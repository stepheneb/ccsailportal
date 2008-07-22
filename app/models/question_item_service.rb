class QuestionItemService < ItemService
  def item_collections()
    author_collection = ItemCollection.new
    author_collection.items = [QisQuestionCreationTool.singleton]
    learner_collection = ItemCollection.new
    learner_collection.items = [] << QisQuestion.all  
    [ author_collection , learner_collection]
  end
  
end

