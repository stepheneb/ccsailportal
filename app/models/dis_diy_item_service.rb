class DisDiyItemService < ItemService
  def create_activity
    DisActivity.find_or_create_by_item_service_id(self)
  end
end
